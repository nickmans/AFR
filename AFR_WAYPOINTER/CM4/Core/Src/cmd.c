
/*
 * cmd.c
 *
 *  Created on: Jun 30, 2025
 *      Author: nicks
 */

#include "main.h"
#include "cmd.h"
#include "cmsis_os.h"
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <ctype.h>
#include "trilateration.h"

uint32_t last_anchor_print = 0;

/* ===== receive buffers ===== */
uint8_t rx_from_pc;
uint8_t rx_from_bu01;
uint8_t rx_from_hc05;

/* ===== circular buffer for BU-01 RX ===== */
#define BU01_BUF_SIZE 256
uint8_t  bu01_rx_buffer[BU01_BUF_SIZE];
volatile uint16_t bu01_rx_write_idx = 0;
volatile uint16_t bu01_rx_read_idx  = 0;

/* ===== line buffer for printing BU-01 responses ===== */
char     line_buf[64];
uint8_t  line_pos = 0;
int anchordistance[3] = {0};  // in millimeters

/* ===== HC05 circular buffer ===== */
uint8_t  hc05_rx_buffer[HC05_BUF_SIZE];
volatile uint16_t hc05_rx_write_idx = 0;
volatile uint16_t hc05_rx_read_idx  = 0;
char hc05_line_buf[64];
uint8_t hc05_line_pos = 0;

/* ===== STM32 command table ===== */
typedef void (*CmdFunc_t)(int argc, char *argv[]);

typedef struct {
    CmdFunc_t   func;    // handler
    const char *cmd;     // name
    const char *args;    // arg list
    const char *help;    // description
} CMD_T;

/* ===== OS thread definitions ===== */
void          cmdlinego(void *argument);
osThreadId_t  cmdlineID;
const osThreadAttr_t cmdline_att = {
  .name       = "cmdline",
  .stack_size = 2048,
  .priority   = (osPriority_t) osPriorityNormal,
};

/* ===== function prototypes ===== */
void uartt_init(void);

/* ---------------------------------------------------------------------- */
/* background task: forward BU-01 data to PC over UART2                   */
/* ---------------------------------------------------------------------- */
void cmdlinego(void *argument)
{
    (void)argument;
    for (;;)
    {
        // === BU-01 direct parsing ===
    	if (bu01_rx_read_idx != bu01_rx_write_idx)
		{
			char c = bu01_rx_buffer[bu01_rx_read_idx++];
			if (bu01_rx_read_idx >= BU01_BUF_SIZE)
				bu01_rx_read_idx = 0;

			line_buf[line_pos++] = c;
			if (c == '\n' || line_pos >= sizeof(line_buf) - 1)
			{
				line_buf[line_pos] = '\0';
				HAL_UART_Transmit(&hcom_uart[COM1], (uint8_t *)line_buf, line_pos, HAL_MAX_DELAY);
				line_pos = 0;
			}
		}

        // === HC-05 Bluetooth parsing ===
        if (hc05_rx_read_idx != hc05_rx_write_idx)
        {

            char c = hc05_rx_buffer[hc05_rx_read_idx++];
            if (hc05_rx_read_idx >= HC05_BUF_SIZE)
                hc05_rx_read_idx = 0;

            if (hc05_line_pos < sizeof(hc05_line_buf) - 1)
                hc05_line_buf[hc05_line_pos++] = c;

            if (c == '\n' || hc05_line_pos >= sizeof(hc05_line_buf) - 1)
            {
                hc05_line_buf[hc05_line_pos] = '\0';

                if (strncmp(hc05_line_buf, "an0:", 4) == 0)
                    anchordistance[0] = (uint16_t)(strtof(&hc05_line_buf[4], NULL) * 1000);
                else if (strncmp(hc05_line_buf, "an2:", 4) == 0)
                    anchordistance[1] = (uint16_t)(strtof(&hc05_line_buf[4], NULL) * 1000);
                else if (strncmp(hc05_line_buf, "an3:", 4) == 0)
                {
                    anchordistance[2] = (uint16_t)(strtof(&hc05_line_buf[4], NULL) * 1000);
                    //uint32_t now = HAL_GetTick();  // current time in ms						// MIGHT NOT NEED TO TIME THIS
					//if (now - last_anchor_print >= 500)
					{

						//last_anchor_print = now;
					//printf("an0=%d mm, an2=%d mm, an3=%d mm\n", anchordistance[0], anchordistance[1], anchordistance[2]);
					if(GetLocation(&tag_position, 0, &(AnchorList[0]), &(anchordistance[0])) != -1)
					{
					printf("Tag Location:x=%3.2fm y=%3.2fm z=%3.2fm\r\n",tag_position.x,tag_position.y,tag_position.z);
					//sprintf(dist_str, "x:%3.2f y:%3.2f",tag_best_solution.x,tag_best_solution.y);
					}
					}
                }
                if (strncmp(hc05_line_buf, "an", 2) != 0)
                	printf("%s\n",hc05_line_buf);

                hc05_line_pos = 0;
            }
        }

        osDelay(1);
    }
}

/* ---------------------------------------------------------------------- */
/* initialize UART interrupts for PC (UART2), BU-01 (UART1), HC-05(UART3)*/
/* ---------------------------------------------------------------------- */
void uartt_init(void)
{
    //HAL_UART_Receive_IT(&huart1, &rx_from_bu01, 1);
    HAL_UART_Receive_IT(&huart2, &rx_from_hc05,   1);
    //HAL_UART_Receive_IT(&huart3, &rx_from_hc05,  1);
}

/* ---------------------------------------------------------------------- */
/* start the command-line thread                                          */
/* ---------------------------------------------------------------------- */
void cmd_line_init(void)
{
    cmdlineID = osThreadNew(cmdlinego, NULL, &cmdline_att);
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart == &huart2) {
        // push into circular buffer
        hc05_rx_buffer[hc05_rx_write_idx++] = rx_from_hc05;
        if (hc05_rx_write_idx >= HC05_BUF_SIZE) hc05_rx_write_idx = 0;
        // re‑arm for next byte
        HAL_UART_Receive_IT(&huart2, &rx_from_hc05, 1);
    }
}
