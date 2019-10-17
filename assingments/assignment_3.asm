TITLE assignment 3

comment !
Write a complete program that will input values for num1 ,num2, and num3 and display the
value of the expression ( (num1 ^ 3) * num2 + 5 * ( num2 ^ 2) ) / num3.

assume that the user enters only numbers that are greater than zero and the calculation never exceed 4 bytes size.
!

include Irvine32.inc

.data
greeting BYTE "hello world", 0ah, 0dh, 0

.code
main proc
	mov edx, OFFSET greeting
	call writeString

	mov	eax,5
	add	eax,6

	exit
main endp
end main
