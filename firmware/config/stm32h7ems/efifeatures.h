#include "../stm32f4ems/efifeatures.h"

#pragma once

#undef EFI_INTERNAL_FLASH
#define EFI_INTERNAL_FLASH FALSE

#undef EFI_FILE_LOGGING
#define EFI_FILE_LOGGING FALSE

#undef EFI_MC33816
#define EFI_MC33816 FALSE

#undef EFI_CAN_SUPPORT
#define EFI_CAN_SUPPORT FALSE

#undef EFI_CJ125
#define EFI_CJ125 FALSE

// todo: our "DMA-half" ChibiOS patch not implemented for USARTv2/STM32H7
#undef TS_UART_DMA_MODE
#define TS_UART_DMA_MODE FALSE

#undef PRIMARY_UART_DMA_MODE
#define PRIMARY_UART_DMA_MODE FALSE

#undef TS_UART_DEVICE
//#define TS_UART_DEVICE (&UARTD3)

#undef EFI_CONSOLE_UART_DEVICE

#undef BOARD_TLE6240_COUNT
#undef BOARD_MC33972_COUNT
#undef BOARD_TLE8888_COUNT
#define BOARD_TLE6240_COUNT	0
#define BOARD_MC33972_COUNT	0
#define BOARD_TLE8888_COUNT 	0

#undef EFI_MAX_31855
#define EFI_MAX_31855 FALSE

#undef BOARD_EXT_GPIOCHIPS
 #define BOARD_EXT_GPIOCHIPS			(BOARD_TLE6240_COUNT + BOARD_MC33972_COUNT + BOARD_TLE8888_COUNT + BOARD_DRV8860_COUNT + BOARD_MC33810_COUNT)
