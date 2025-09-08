/*
 * uart5_comm.h — minimal command-by-number over UART5 (IT mode)
 */
#ifndef INC_UART5_COMM_H_
#define INC_UART5_COMM_H_

#include "main.h"
#include "cmsis_os2.h"
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// API (same names as before so main.c doesn't change)
void UART5_Comm_Init(void);    // create queue + arm RX-IT (call after HAL init)
// Global run-state flag (0=stopped, 1=started)
extern volatile uint32_t started;
extern volatile uint32_t userstop;

#ifdef __cplusplus
}
#endif
#endif
