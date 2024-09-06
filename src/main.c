#include "types.h"



#define RCC 0x40023800
#define GPIOC 0x40020800
static volatile uint32_t* RCC_AHB1ENR =	(uint32_t*)(RCC + 0x30);
static volatile uint32_t* GPIOC_MODER =	(uint32_t*)(GPIOC);
static volatile uint32_t* GPIOC_BSRR =	(uint32_t*)(GPIOC + 0x18);

// #include <cmath>

// application
void main_app(void) {
	(*RCC_AHB1ENR) |= 0x1 << 2;
	(*GPIOC_MODER) |= 0x1 << (2*13);
	// double x = 0.0;
	// double y = 0.0;
	while (1) {
		// y = sin(x);
		// x += y;
		(*GPIOC_BSRR) = 0x1 << 13;
		//for (uint32_t i = 0; i < 0xFFFFF; i++) { (void)i; }
		(*GPIOC_BSRR) = 0x10000 << 13;
	}
}