#!/bin/bash
SRC=" main.c"
SRC+=" stm32g4xx_it.c"
SRC+=" syscalls.c"
SRC+=" sysmem.c"
SRC+=" system_stm32g4xx.c"
SRC+=" startup_stm32g431rbtx.s"

SRC+=" ../STM32CubeG4/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_utils.c"

INCLUDES=" -I."
INCLUDES+=" -I../STM32CubeG4/Drivers/CMSIS/Include"
INCLUDES+=" -I../STM32CubeG4/Drivers/CMSIS/Device/ST/STM32G4xx/Include"
INCLUDES+=" -I../STM32CubeG4/Drivers/STM32G4xx_HAL_Driver/Inc"

ARCH_FLAGS="-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16"

CFLAGS=" -Os"
CFLAGS+=" -DUSE_FULL_LL_DRIVER -DSTM32G431xx -DHSI_VALUE=16000000"

LDFLAGS="-TSTM32G431RBTX_FLASH.ld"
LDFLAGS+=" -specs=nano.specs"
LDFLAGS+=" -Wl,--gc-sections"

arm-none-eabi-gcc -o project2.elf $ARCH_FLAGS $CFLAGS $INCLUDES $LDFLAGS $SRC
arm-none-eabi-objcopy -O binary project2.elf project2.bin
arm-none-eabi-objdump -x -S -C project2.elf > project2.lst
arm-none-eabi-size project2.elf

