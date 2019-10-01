TITLE   sample asm file

INCLUDE Irvine32.inc

.data
greeting BYTE "Hello world", 0ah, 0dh, 0

.code
main PROC
	mov edx, OFFSET greeting
	call writeString

	exit
main ENDP

END main