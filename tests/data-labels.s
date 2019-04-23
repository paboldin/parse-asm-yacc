	.data
	.align 32
	.type	predefined_sections, @object
	.size	predefined_sections, 1400
predefined_sections:
	.quad	.LC10
	.zero	48
	.local	abc
	.comm	abc,8,8
	.zero	48
	.section .rodata

.LC10:
	.byte	1
