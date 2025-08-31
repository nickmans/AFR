################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Src/control_update_MPC/qpoases/SRC/Bounds.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/Constraints.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/Indexlist.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/QProblem.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/QProblemB.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.cpp \
../Core/Src/control_update_MPC/qpoases/SRC/Utils.cpp 

OBJS += \
./Core/Src/control_update_MPC/qpoases/SRC/Bounds.o \
./Core/Src/control_update_MPC/qpoases/SRC/Constraints.o \
./Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.o \
./Core/Src/control_update_MPC/qpoases/SRC/Indexlist.o \
./Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.o \
./Core/Src/control_update_MPC/qpoases/SRC/QProblem.o \
./Core/Src/control_update_MPC/qpoases/SRC/QProblemB.o \
./Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.o \
./Core/Src/control_update_MPC/qpoases/SRC/Utils.o 

CPP_DEPS += \
./Core/Src/control_update_MPC/qpoases/SRC/Bounds.d \
./Core/Src/control_update_MPC/qpoases/SRC/Constraints.d \
./Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.d \
./Core/Src/control_update_MPC/qpoases/SRC/Indexlist.d \
./Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.d \
./Core/Src/control_update_MPC/qpoases/SRC/QProblem.d \
./Core/Src/control_update_MPC/qpoases/SRC/QProblemB.d \
./Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.d \
./Core/Src/control_update_MPC/qpoases/SRC/Utils.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/control_update_MPC/qpoases/SRC/%.o Core/Src/control_update_MPC/qpoases/SRC/%.su Core/Src/control_update_MPC/qpoases/SRC/%.cyclo: ../Core/Src/control_update_MPC/qpoases/SRC/%.cpp Core/Src/control_update_MPC/qpoases/SRC/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m7 -std=gnu++14 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H755xx -DUSE_PWR_DIRECT_SMPS_SUPPLY -DUSE_NUCLEO_64 -DSTM32_THREAD_SAFE_STRATEGY=4 -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Drivers/BSP/STM32H7xx_Nucleo -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Include" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Include/dsp" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases/INCLUDE" -I"C:/Users/nicks/STM32CubeIDE/workspace_1.19.0/AFR/AFR/CM7/Core/Src/control_update_MPC/qpoases/SRC" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-control_update_MPC-2f-qpoases-2f-SRC

clean-Core-2f-Src-2f-control_update_MPC-2f-qpoases-2f-SRC:
	-$(RM) ./Core/Src/control_update_MPC/qpoases/SRC/Bounds.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/Bounds.d ./Core/Src/control_update_MPC/qpoases/SRC/Bounds.o ./Core/Src/control_update_MPC/qpoases/SRC/Bounds.su ./Core/Src/control_update_MPC/qpoases/SRC/Constraints.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/Constraints.d ./Core/Src/control_update_MPC/qpoases/SRC/Constraints.o ./Core/Src/control_update_MPC/qpoases/SRC/Constraints.su ./Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.d ./Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.o ./Core/Src/control_update_MPC/qpoases/SRC/CyclingManager.su ./Core/Src/control_update_MPC/qpoases/SRC/Indexlist.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/Indexlist.d ./Core/Src/control_update_MPC/qpoases/SRC/Indexlist.o ./Core/Src/control_update_MPC/qpoases/SRC/Indexlist.su ./Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.d ./Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.o ./Core/Src/control_update_MPC/qpoases/SRC/MessageHandling.su ./Core/Src/control_update_MPC/qpoases/SRC/QProblem.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/QProblem.d ./Core/Src/control_update_MPC/qpoases/SRC/QProblem.o ./Core/Src/control_update_MPC/qpoases/SRC/QProblem.su ./Core/Src/control_update_MPC/qpoases/SRC/QProblemB.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/QProblemB.d ./Core/Src/control_update_MPC/qpoases/SRC/QProblemB.o ./Core/Src/control_update_MPC/qpoases/SRC/QProblemB.su ./Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.d ./Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.o ./Core/Src/control_update_MPC/qpoases/SRC/SubjectTo.su ./Core/Src/control_update_MPC/qpoases/SRC/Utils.cyclo ./Core/Src/control_update_MPC/qpoases/SRC/Utils.d ./Core/Src/control_update_MPC/qpoases/SRC/Utils.o ./Core/Src/control_update_MPC/qpoases/SRC/Utils.su

.PHONY: clean-Core-2f-Src-2f-control_update_MPC-2f-qpoases-2f-SRC

