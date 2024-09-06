.section	.vector,	"a",	%progbits
.type		isr_vector,			%object
isr_vector:
.word  _estack
.word  Reset_Handler

.word  NMI_Handler
.word  HardFault_Handler
.word  MemManage_Handler
.word  BusFault_Handler
.word  UsageFault_Handler
.word  0
.word  0
.word  0
.word  0
.word  SVC_Handler
.word  DebugMon_Handler
.word  0
.word  PendSV_Handler
.word  SysTick_Handler
