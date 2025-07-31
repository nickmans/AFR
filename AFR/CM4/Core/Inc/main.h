/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32h7xx_hal.h"

#include "stm32h7xx_nucleo.h"
#include <stdio.h>

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);
void MX_ADC3_Init(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define M1_A_Pin GPIO_PIN_7
#define M1_A_GPIO_Port GPIOF
#define M2_A_Pin GPIO_PIN_8
#define M2_A_GPIO_Port GPIOF
#define M3_A_Pin GPIO_PIN_9
#define M3_A_GPIO_Port GPIOF
#define M4_A_Pin GPIO_PIN_10
#define M4_A_GPIO_Port GPIOF
#define HC05_TX_Pin GPIO_PIN_0
#define HC05_TX_GPIO_Port GPIOA
#define BATT_V_Pin GPIO_PIN_3
#define BATT_V_GPIO_Port GPIOA
#define M34DIR1_Pin GPIO_PIN_7
#define M34DIR1_GPIO_Port GPIOE
#define M34DIR2_Pin GPIO_PIN_8
#define M34DIR2_GPIO_Port GPIOE
#define PWM_1_Pin GPIO_PIN_9
#define PWM_1_GPIO_Port GPIOE
#define M12DIR1_Pin GPIO_PIN_10
#define M12DIR1_GPIO_Port GPIOE
#define PWM_2_Pin GPIO_PIN_11
#define PWM_2_GPIO_Port GPIOE
#define M12DIR2_Pin GPIO_PIN_12
#define M12DIR2_GPIO_Port GPIOE
#define PWM_3_Pin GPIO_PIN_13
#define PWM_3_GPIO_Port GPIOE
#define PWM_4_Pin GPIO_PIN_14
#define PWM_4_GPIO_Port GPIOE
#define HC06_RX_Pin GPIO_PIN_12
#define HC06_RX_GPIO_Port GPIOB
#define ENC_4_Pin GPIO_PIN_11
#define ENC_4_GPIO_Port GPIOD
#define ENC_4_EXTI_IRQn EXTI15_10_IRQn
#define ENC_1_Pin GPIO_PIN_12
#define ENC_1_GPIO_Port GPIOD
#define ENC_1_EXTI_IRQn EXTI15_10_IRQn
#define ENC_2_Pin GPIO_PIN_14
#define ENC_2_GPIO_Port GPIOD
#define ENC_2_EXTI_IRQn EXTI15_10_IRQn
#define ENC_3_Pin GPIO_PIN_15
#define ENC_3_GPIO_Port GPIOD
#define ENC_3_EXTI_IRQn EXTI15_10_IRQn
#define M34STBY_Pin GPIO_PIN_6
#define M34STBY_GPIO_Port GPIOG
#define M12STBY_Pin GPIO_PIN_8
#define M12STBY_GPIO_Port GPIOG
#define HC05_RX_Pin GPIO_PIN_11
#define HC05_RX_GPIO_Port GPIOC
#define HC06_TX_Pin GPIO_PIN_12
#define HC06_TX_GPIO_Port GPIOC

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
