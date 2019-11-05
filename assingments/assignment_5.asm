; Assignment 5 other procedures in assembly

comment !

date: 10/30/19

Write a complete program that:


!


include Irvine32.inc

.data
; //////////// Data storage here

; # Format and text
inputPrompt byte "enter a number: ", 0


; # Array for numbers


; # Calculation variables



.code
main proc
; /////////// Main code here


; # 1 # Loop the prompt and input method 10 times w/counter for Prompt

mov edi, OFFSET arr
mov ecx, LENGTHOF arr
mov edx, OFFSET inputPrompt

L1:
	call writeString

	call readDec
	mov [edi], eax
	add edi, type arr
loop L1


; # 2 # Sum all variables and print



; # 3 # ....



; # end of code #


call crlf
call crlf

	exit
main endp
end main

; //////////// Example run

comment !
Result of run:


!
