//
// Created by marijn on 9/7/24.
//
#include "types.h"
#include "periph.h"


static volatile uint32_t* RCC_CR =		(uint32_t*)(RCC);
static volatile uint32_t* RCC_CFGR =	(uint32_t*)(RCC + 0x8);
static volatile uint32_t* SYSTICK_CTRL =(uint32_t*)(SysTick_BASE);


void sys_init() {
	(*SYSTICK_CTRL) = 0x0;
	(*RCC_CR) |= 0x1;    // enable HSI
	(*RCC_CFGR) = 0x00000000;  // reset
	/* Reset HSEON, HSECSSON, CSION, HSI48ON, CSIKERON, PLL1ON, PLL2ON and PLL3ON bits */
	(*RCC_CR) &= 0xEAF6ED7FU;
}
