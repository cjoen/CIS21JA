; Addition and Subtraction					(AddSubTest.asm)

; Chapter 4 example. Demonstration of ADD, SUB,
; INC, DEC, and NEG instructions, and how
; they affect the CPU status flags.

include Irvine32.inc

;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess proto,dwExitCode:dword

.data
Rval   SDWORD ?
Xval   SDWORD 26
Yval   SDWORD 30
Zval   SDWORD 40

.code
main proc
	; INC and DEC
	xor eax, eax
	mov	ax,1h
	inc	ax		; 1001h
	call writeDec
	call crlf
	dec	ax		; 1000h
	call writeDec
	call crlf
	
	; Expression: Rval = -Xval + (Yval - Zval)
	mov	eax,Xval
	neg	eax			; -26
	mov	ebx,Yval
	sub	ebx,Zval	; -10
	add	eax,ebx
	mov	Rval,eax	; -36

	; Zero flag example:
	mov	cx,1
	sub	cx,1		; ZF = 1
	mov	ax,0FFFFh
	inc	ax			; ZF = 1

	; Sign flag example:
	mov	cx,0
	sub	cx,1		; SF = 1
	mov	ax,7FFFh
	add	ax,2		; SF = 1

	; Carry flag example:
	mov	al,0FFh
	add	al,1		; CF = 1,  AL = 00

	; Overflow flag example:
	mov	al,+127
	add	al,1		; OF = 1
	mov	al,-128
	sub	al,1		; OF = 1

	;invoke ExitProcess,0
	exit
main endp
end main