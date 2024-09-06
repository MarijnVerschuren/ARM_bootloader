.syntax unified
.thumb

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
