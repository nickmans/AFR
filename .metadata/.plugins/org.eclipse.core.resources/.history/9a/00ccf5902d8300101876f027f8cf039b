/*
 * sensor.h
 *
 *  Created on: Jul 23, 2025
 *      Author: nicks
 */

#ifndef INC_SENSOR_H_
#define INC_SENSOR_H_

#include <stdbool.h>
void bno055_CONFIG(void);
void bno055_NDOF(void);
bool BNO055_ApplyAllCalibration();
bool BNO055_ReadEuler(double *heading, double *roll, double *pitch);
bool BNO055_ReadLinAccel_D(double *ax, double *ay, double *az);
void ComputeLinearAccel(double *ax_lin, double *ay_lin, double *az_lin);
bool BNO055_CalibrateAccelOnce(uint8_t offsets[6], uint32_t timeout_ms);

#define ADC_CH        4
#define N_SAMPLES     32                // even
#define VREF          3.3f
#define ACS_SENS      0.132f            // V/A for your ACS71240 variant (adjust)
#define V_ZERO        (VREF * 0.5f)

extern volatile uint16_t adc_buf[ADC_CH * N_SAMPLES];
extern volatile float motor_current[ADC_CH];    // filtered A, read by PWM.c

#endif /* INC_SENSOR_H_ */
