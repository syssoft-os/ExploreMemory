	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 2
	.globl	_print_hex                      ; -- Begin function print_hex
	.p2align	2
_print_hex:                             ; @print_hex
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #24]
	ldur	x10, [x29, #-8]
	ldr	x8, [sp, #24]
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	sub	x8, x29, #20
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	mov	w8, #42
	stur	w8, [x29, #-36]                 ; 4-byte Folded Spill
	stur	w8, [x29, #-20]
	ldursw	x1, [x29, #-20]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_print_hex
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_print_hex
	adrp	x8, _b@PAGE
	adrp	x9, _b@PAGE
	add	x9, x9, _b@PAGEOFF
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	ldrsw	x1, [x8, _b@PAGEOFF]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_print_hex
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_print_hex
	mov	x0, #4
	bl	_malloc
	sub	x8, x29, #32
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	stur	x0, [x29, #-32]
	ldur	x9, [x29, #-32]
	mov	w8, #44
	str	w8, [x9]
	ldur	x1, [x29, #-32]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	bl	_print_hex
	ldr	x1, [sp, #24]                   ; 8-byte Folded Reload
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_print_hex
	ldur	x8, [x29, #-32]
	ldrsw	x1, [x8]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	str	x0, [sp, #48]                   ; 8-byte Folded Spill
	bl	_print_hex
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	adrp	x1, _main@PAGE
	add	x1, x1, _main@PAGEOFF
	str	x1, [sp, #32]                   ; 8-byte Folded Spill
	bl	_print_hex
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	adrp	x1, _print_hex@PAGE
	add	x1, x1, _print_hex@PAGEOFF
	bl	_print_hex
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	adrp	x1, _printf@GOTPAGE
	ldr	x1, [x1, _printf@GOTPAGEOFF]
	bl	_print_hex
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-32]
	ldur	x1, [x29, #-32]
	bl	_print_hex
	ldr	x0, [sp, #48]                   ; 8-byte Folded Reload
	ldur	x8, [x29, #-32]
	ldrsw	x1, [x8]
	bl	_print_hex
	ldr	x0, [sp, #48]                   ; 8-byte Folded Reload
	ldur	x9, [x29, #-32]
	mov	w8, #45
	str	w8, [x9]
	ldur	x8, [x29, #-32]
	ldrsw	x1, [x8]
	bl	_print_hex
	ldur	w0, [x29, #-36]                 ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%-24s: 0x%016llx\n"

	.section	__DATA,__data
	.globl	_b                              ; @b
	.p2align	2, 0x0
_b:
	.long	43                              ; 0x2b

	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"Content of a"

l_.str.2:                               ; @.str.2
	.asciz	"Address of a"

l_.str.3:                               ; @.str.3
	.asciz	"Content of b"

l_.str.4:                               ; @.str.4
	.asciz	"Address of b"

l_.str.5:                               ; @.str.5
	.asciz	"Content of int_ptr"

l_.str.6:                               ; @.str.6
	.asciz	"Address of int_ptr"

l_.str.7:                               ; @.str.7
	.asciz	"Content of *int_ptr"

l_.str.8:                               ; @.str.8
	.asciz	"Address of main"

l_.str.9:                               ; @.str.9
	.asciz	"Address of print_hex"

l_.str.10:                              ; @.str.10
	.asciz	"Address of printf"

.subsections_via_symbols
