################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.cpp 

OBJS += \
./Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.o 

CPP_DEPS += \
./Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/%.o Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/%.su Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/%.cyclo: ../Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/%.cpp Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m7 -std=gnu++14 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H755xx -DUSE_PWR_DIRECT_SMPS_SUPPLY -DUSE_NUCLEO_64 -DSTM32_THREAD_SAFE_STRATEGY=4 -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Drivers/BSP/STM32H7xx_Nucleo -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Include" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Include/dsp" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases/INCLUDE" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases/SRC" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-control_update_MPC-2f-qpoases-2f-SRC-2f-EXTRAS

clean-Core-2f-Src-2f-control_update_MPC-2f-qpoases-2f-SRC-2f-EXTRAS:
	-$(RM) ./Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.d ./Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.o ./Core/Src/control_update_MPC/qpoases/SRC/EXTRAS/SolutionAnalysis.su

.PHONY: clean-Core-2f-Src-2f-control_update_MPC-2f-qpoases-2f-SRC-2f-EXTRAS

