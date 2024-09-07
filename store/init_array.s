.syntax unified
.thumb

// function definitions
.global init_array
.global fini_array

// memory layout constants
.section .data
.word _pre_init_array_start
.word _pre_init_array_end
.word _init_array_start
.word _init_array_end
.word _fini_array_start
.word _fini_array_end


// pre init array
.section .pre_init_array, "a", %progbits

// init array
.section .pre_init_array, "a", %progbits

// fini array
.section .pre_init_array, "a", %progbits


// functions
.section .text
.type init_array, %function
init_array:
	ldr r0, =_pre_init_array_start	// src
	ldr r1, =_pre_init_array_end	// end
	b pre_init_array_condition		// start pre_init_array loop
pre_init_array_loop:
	blx r0							// call pre_init function
	adds r0, r0, #4					// src += 4
pre_init_array_condition:
	cmp r0, r1						// compare with end
	bcc pre_init_array_loop			// branch if src < end
	
	ldr r0, =_init_array_start		// src
	ldr r1, =_init_array_end		// end
	b init_array_condition			// start init_array loop
init_array_loop:
	blx r0							// call init function
	adds r0, r0, #4					// src += 4
init_array_condition:
	cmp r0, r1						// compare with end
	bcc init_array_loop				// branch if src < end
.size init_array, .-init_array


.type fini_array, %function
fini_array:
	ldr r0, =_fini_array_start		// src
	ldr r1, =_fini_array_end		// end
	b fini_array_condition			// start fini_array loop
fini_array_loop:
	blx r0							// call fini function
	adds r0, r0, #4					// src += 4
fini_array_condition:
	cmp r0, r1						// compare with end
	bcc	fini_array_loop				// branch if src < end
.size fini_array, .-fini_array

