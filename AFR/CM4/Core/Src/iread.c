/*
 * iread.c
 *
 *  Created on: Aug 27, 2025
 *      Author: nicks
 */

#include "main.h"
#include "sensor.h"

__attribute__((aligned(32))) volatile uint16_t adc_buf[ADC_CH * N_SAMPLES];
volatile float motor_currentwr[ADC_CH];    // filtered A, read by PWM.c
volatile float motor_current[ADC_CH];    // filtered A, read by PWM.c

volatile uint16_t zero_counts[ADC_CH] = {32768,32768,32768,32768};
volatile float    vdda_V = 3.19f;  // provisional VDDA from your measurements

static inline float amps_from_counts(uint16_t c, uint16_t zc){
    // Δcounts -> volts using *actual* VDDA -> amps
    float lsb_V = vdda_V / 65535.0f;
    return ((int)c - (int)zc) * (lsb_V / ACS_SENS);
}

static void average_block(uint16_t *base, int n){
    uint32_t acc[ADC_CH]={0};
    for (int i=0;i<n;i++)
        for (int ch=0; ch<ADC_CH; ch++)
            acc[ch] += base[i*ADC_CH + ch];

    for (int ch=0; ch<ADC_CH; ch++){
        uint16_t avgc = (uint16_t)(acc[ch]/(uint32_t)n);
        motor_currentwr[ch] = amps_from_counts(avgc, zero_counts[ch]);
    }
    motor_current[0] = motor_currentwr[1];
    motor_current[1] = motor_currentwr[0];
    motor_current[2] = motor_currentwr[3];
    motor_current[3] = motor_currentwr[2];
}

void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef *hadc){
    if (hadc->Instance==ADC3){
    	//SCB_InvalidateDCache_by_Addr((uint32_t*)adc_buf, sizeof(uint16_t) * ADC_CH * N_SAMPLES);
        average_block((uint16_t*)&adc_buf[0], N_SAMPLES/2);
    }
}
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc){
    if (hadc->Instance==ADC3){
    	//SCB_InvalidateDCache_by_Addr((uint32_t*)adc_buf, sizeof(uint16_t) * ADC_CH * N_SAMPLES);
        average_block((uint16_t*)&adc_buf[(ADC_CH*N_SAMPLES)/2], N_SAMPLES/2);
    }
}
