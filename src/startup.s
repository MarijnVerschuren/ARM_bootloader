.syntax unified
.thumb

// memory layout constants
.section .data
.word _data_load
.word _data_start
.word _data_end
.word _bss_start
.word _bss_end
.word _heap_start


// reset handler
.section .text.reset_handler
.weak reset_handler
.type reset_handler, %function
reset_handler:
	ldr sp, =_stack_end
	
	// copy_data
	ldr r0, =_data_load				// src
	ldr r1, =_data_start			// dst
	ldr r2, =_data_end				// end
	movs r3, #0						// idx
	b copy_data_condition			// start copy_data loop
copy_data:
	ldr r4, [r0, r3]				// load from	src+idx
	str r4, [r1, r3]				// store to	dst+idx
	adds r3, r3, #4					// idx += 4
copy_data_condition:
	adds r4, r0, r3					// src+idx
	cmp r4, r2						// compare with end
	bcc copy_data					// branch if r4 < r2
	
	// zero_bss
	ldr r0, =_bss_start				// dst
	ldr r1, =_bss_end				// end
	movs r2, #0						// zero
	b zero_bss_condition			// start zero_bss loop
zero_bss:
	str r2, [r0]					// set to zero
	adds r0, r0, #4					// dst += 4
zero_bss_condition:
	cmp r0, r1						// compare with end
	bcc zero_bss					// branch if dst < end
	
	// pre_init_array
	ldr r1, =_pre_init_array_start	// src
	ldr r2, =_pre_init_array_end	// end
	b pre_init_array_condition		// start pre_init_array loop 
pre_init_array:
	bl [r1]							// call pre_init function
	adds r1, r1, #4					// src += 4
pre_init_array_condition:
	cmp r1, r2						// compare with end
	bcc pre_init_array				// branch if src < end
	
	// init_array
	ldr r1, =_init_array_start		// src
	ldr r2, =_init_array_end		// end
	b init_array_condition			// start init_array loop
init_array:
	bl [r1]							// call init function
	adds r1, r1, #4					// src += 4
init_array_condition:
	cmp r1, r2						// compare with end
	bcc init_array					// branch if src < end

	// call main
	bl main_app
	
	// fini_array
	ldr r1, =_fini_array_start		// src
	ldr r2, =_fini_array_end		// end
	b fini_array_condition			// start fini_array loop
fini_array:
	bl [r1]							// call fini function
	adds r1, r1, #4					// src += 4
fini_array_condition:
	cmp r1, r2						// compare with end
	bcc	fini_array					// branch if src < end
	
	bx lr
.size reset_handler, .-reset_handler

