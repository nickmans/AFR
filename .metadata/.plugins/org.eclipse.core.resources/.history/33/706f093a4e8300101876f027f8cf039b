/*
 * PWM.c
 *
 *  Created on: Aug 7, 2025
 *      Author: nicks
 */

/* ===== OS thread definitions ===== */
#include "main.h"
#include "cmsis_os.h"
#include <string.h>
#include "shared_mem.h"
#include <stdbool.h>
#define CPR               330u
#define MAX_CURR_A        0.8
#define PWM_MAX           (__HAL_TIM_GET_AUTORELOAD(&htim1))
#define CONTROL_TIMEOUT   pdMS_TO_TICKS(25u)
#define NEW_SP_FLAG       (1U<<0)
#define PI 3.141592653589793

// gains
static const double Kp = 0.1, Ki = 0.02;
static const double RPM_FS[4] = { 298.182, 312.727, 312.727, 312.727 };

// state
static double integ[4] = {0};
static double sp_rpm[4] = {0};      // most-recent setpoint in RPM
static const uint32_t CH[4] = { TIM_CHANNEL_1, TIM_CHANNEL_2, TIM_CHANNEL_3, TIM_CHANNEL_4 };

void pwmgo(void *argument);
osThreadId_t  pwm_id;
const osThreadAttr_t pwm_att = {
  .name       = "pwmline",
  .stack_size = 1028 * 4,
  .priority   = (osPriority_t) osPriorityNormal,
};

void M7control(void *argument);
osThreadId_t  M7control_id;
const osThreadAttr_t M7control_att = {
  .name       = "M7control",
  .stack_size = 128 * 4,
  .priority   = (osPriority_t) osPriorityHigh,
};

static volatile int32_t encoder_count[4] = {0};
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	if (GPIO_Pin == ENC_1_Pin){
		encoder_count[0]++;
	} else if (GPIO_Pin == ENC_2_Pin){
		encoder_count[1]++;
	} else if (GPIO_Pin == ENC_3_Pin){
		encoder_count[2]++;
	} else if (GPIO_Pin == ENC_4_Pin){
		encoder_count[3]++;
	}
}

void NotifyNewSetpoint(void)
{
	osThreadFlagsSet(pwm_id, NEW_SP_FLAG);
}

void M7control(void *arg)
{
	for(;;)
	{
		if (SHARED_MEM->flagm7)
		{
			NotifyNewSetpoint();
		}
		osDelay(1);
	}
}

void pwmgo(void *arg)
{
	uint32_t last_ms = HAL_GetTick();
	for (;;)
	{
		// 1) block until NEW_SP_FLAG arrives OR 25 ms elapses
		uint32_t flags = osThreadFlagsWait(NEW_SP_FLAG, osFlagsWaitAny, CONTROL_TIMEOUT);

		// 2) measure actual dt (in seconds) since last update
		uint32_t now_ms = HAL_GetTick();
		double dt = (now_ms - last_ms)*1e-3;
		if (dt < 1e-4) dt = 1e-4;
		last_ms = now_ms;

		// 3) if we woke on the flag, grab & convert the new control_u[]
		if (flags & NEW_SP_FLAG)
		{
			for (int i = 0; i < 4; i++)
			sp_rpm[i] = SHARED_MEM->control_u[i] * (60/(2*PI));
	    	SHARED_MEM->flagm7 = 0;
			__DSB();    // ensure the write completes
		}
		// else: timeout → reuse old sp_rpm[]

		// 4) snap & clear encoders
		uint32_t counts[4];
		__disable_irq();
		  memcpy(counts, encoder_count, sizeof counts);
		  memset((void*)encoder_count, 0, sizeof encoder_count);
		__enable_irq();

		// 5) compute actual RPM
		const double k_rpm = 60.0/(CPR*dt);
		double rpm[4];
		for (int i = 0; i < 4; i++)
			rpm[i] = counts[i]*k_rpm;

		// 6) run PI+FF+current-limit+PWM for each motor
		for (int i = 0; i < 4; i++)
		{
		    const double err = sp_rpm[i] - rpm[i];

		    // feedforward
		    const double u_ff = (sp_rpm[i] / RPM_FS[i]) * PWM_MAX;

		    // PI (use current integ value for control calc)
		    const double u_fb = Kp*err + Ki*integ[i];
		    const double duty_raw = u_ff + u_fb;

		    // current limit (guard div-by-zero and negative readings)
		    double duty = duty_raw;

		    const double cur = 0; // read_current(i)
		    // MOTOR 1 -> motor_current[1]
		    // MOTOR 2 -> motor_current[0]
		    // MOTOR 3 -> motor_current[3]
		    // MOTOR 4 -> motor_current[2]

		    if (cur > 0.0 && cur > MAX_CURR_A) {
		        duty *= (MAX_CURR_A / cur);
		    }

		    // clamp to [0, PWM_MAX]
		    if (duty < 0)        duty = 0;
		    else if (duty > PWM_MAX) duty = PWM_MAX;

		    // -------- anti-windup: conditional integration + back-calculation --------
		    // Only integrate if not saturated OR the error would drive the output back toward the linear region.
		    const bool saturated_lo = (duty <= 0.0);
		    const bool saturated_hi = (duty >= PWM_MAX);
		    const bool allow_integ  =
		        (!saturated_lo && !saturated_hi) ||
		        (saturated_lo && err > 0) ||
		        (saturated_hi && err < 0);

		    if (allow_integ) {
		        integ[i] += err * dt;
		    } else {
		        // simple back-calc: remove the last contribution that caused saturation
		        // (equivalent to "track" the saturated actuator)
		        integ[i] -= err * dt;
		    }

		    // hard cap
		    // after (fixed margin version, 20%):
		    const double INTEG_CAP = (0.20 * PWM_MAX) / Ki;   // ≈ 490 with your settings
		    if (integ[i] >  INTEG_CAP) integ[i] =  INTEG_CAP;
		    if (integ[i] < -INTEG_CAP) integ[i] = -INTEG_CAP;
		    // ------------------------------------------------------------------------

		    __HAL_TIM_SET_COMPARE(&htim1, CH[i], (uint32_t)duty);
		}
	}
}

void pwm_init(void)
{
	HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_1);
	HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_2);
	HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_3);
	HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_4);
	pwm_id = osThreadNew(pwmgo, NULL, &pwm_att);
    M7control_id = osThreadNew(M7control, NULL, &M7control_att);
}

void FORWARD12(void)
{
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_10, GPIO_PIN_SET);
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_12, GPIO_PIN_RESET);
}

void FORWARD34(void)
{
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_7, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_8, GPIO_PIN_SET);
}

void REVERSE12(void)
{
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_10, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_12, GPIO_PIN_SET);
}

void REVERSE34(void)
{
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_7, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_8, GPIO_PIN_RESET);
}

