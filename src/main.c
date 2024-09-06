#include "types.h"



#define RCC 0x40023800
#define GPIOA 0x40020000
#define GPIOC 0x40020800

static volatile uint32_t* RCC_AHB1ENR =	(uint32_t*)(RCC + 0x30);
static volatile uint32_t* GPIOC_MODER =	(uint32_t*)(GPIOC);
static volatile uint32_t* GPIOC_BSRR =	(uint32_t*)(GPIOC + 0x18);
static volatile uint32_t* GPIOA_MODER =	(uint32_t*)(GPIOA);
static volatile uint32_t* GPIOA_BSRR =	(uint32_t*)(GPIOA + 0x18);

#define PIN 8

// application
void main_app(void) {
	(*RCC_AHB1ENR) |= (0x1 << 2) | 0x1;
	(*GPIOA_MODER) |= 0x1 << (2*PIN);
	// double x = 0.0;
	// double y = 0.0;
	while (1) {
		// y = sin(x);
		// x += y;
		(*GPIOA_BSRR) = 0x1 << PIN;
		//for (uint32_t i = 0; i < 0xFFFFF; i++) { (void)i; }
		(*GPIOA_BSRR) = 0x10000 << PIN;
	}
}