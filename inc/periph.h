//
// Created by marijn on 9/7/24.
//

#ifndef ARM_BOOTLOADER_PERIPH_H
#define ARM_BOOTLOADER_PERIPH_H


/*!<
 * core hardware memory map
 * */
#define SCS_BASE			(0xE000E000UL)
#define ITM_BASE			(0xE0000000UL)
#define DWT_BASE			(0xE0001000UL)
#define TPI_BASE			(0xE0040000UL)
#define CORE_DEBUG_BASE		(0xE000EDF0UL)

#define SYS_TICK_BASE		(SCS_BASE +  0x0010UL)
#define NVIC_BASE			(SCS_BASE +  0x0100UL)
#define SCB_BASE			(SCS_BASE +  0x0D00UL)


/*!<
 * extended hardware memory map
 * */
#define FLASH_BASE			0x08000000UL
#define SRAM_BASE			0x20000000UL
#define PERIPH_BASE			0x40000000UL
// TODO BIT BAND?, OTP?


#endif //ARM_BOOTLOADER_PERIPH_H
