################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/control_update_MPC/acado_auxiliary_functions.c \
../Core/Src/control_update_MPC/acado_integrator.c \
../Core/Src/control_update_MPC/acado_solver.c 

OBJS += \
./Core/Src/control_update_MPC/acado_auxiliary_functions.o \
./Core/Src/control_update_MPC/acado_integrator.o \
./Core/Src/control_update_MPC/acado_solver.o 

C_DEPS += \
./Core/Src/control_update_MPC/acado_auxiliary_functions.d \
./Core/Src/control_update_MPC/acado_integrator.d \
./Core/Src/control_update_MPC/acado_solver.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/control_update_MPC/%.o Core/Src/control_update_MPC/%.su Core/Src/control_update_MPC/%.cyclo: ../Core/Src/control_update_MPC/%.c Core/Src/control_update_MPC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H755xx -DUSE_PWR_DIRECT_SMPS_SUPPLY -DUSE_NUCLEO_64 -DSTM32_THREAD_SAFE_STRATEGY=4 -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Drivers/BSP/STM32H7xx_Nucleo -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Include" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Include/dsp" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases/INCLUDE" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases/SRC" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-control_update_MPC

clean-Core-2f-Src-2f-control_update_MPC:
	-$(RM) ./Core/Src/control_update_MPC/acado_auxiliary_functions.cyclo ./Core/Src/control_update_MPC/acado_auxiliary_functions.d ./Core/Src/control_update_MPC/acado_auxiliary_functions.o ./Core/Src/control_update_MPC/acado_auxiliary_functions.su ./Core/Src/control_update_MPC/acado_integrator.cyclo ./Core/Src/control_update_MPC/acado_integrator.d ./Core/Src/control_update_MPC/acado_integrator.o ./Core/Src/control_update_MPC/acado_integrator.su ./Core/Src/control_update_MPC/acado_solver.cyclo ./Core/Src/control_update_MPC/acado_solver.d ./Core/Src/control_update_MPC/acado_solver.o ./Core/Src/control_update_MPC/acado_solver.su

.PHONY: clean-Core-2f-Src-2f-control_update_MPC

