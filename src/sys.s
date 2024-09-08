.syntax unified
.thumb

.global systick_handler
.global NMI_handler
.global hard_fault_handler


.section .text.systick_handler
.type systick_handler, %function
systick_handler:
	bkpt #1
	bx lr
.size systick_handler, .-systick_handler


.section .text.hard_fault_handler
.type hard_fault_handler, %function
hard_fault_handler:  // TODO: why is hard_fault triggered on BCC instruction
	bkpt #1
	bx lr
.size hard_fault_handler, .-hard_fault_handler