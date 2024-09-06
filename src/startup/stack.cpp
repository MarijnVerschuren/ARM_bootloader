// stack definition code

// top of stack
extern unsigned _stack_end;

// initial stack pointer is first address of program
__attribute__((section(".stack"), used)) unsigned *_stack_init = &_stack_end;