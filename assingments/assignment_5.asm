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
waitStr byte "Press any key to continue...", 0


; # Calculation variables
var1 dword ?
var2 dword ?

sum dword ?
difference dword ?



.code
main proc
; /////////// Main code here

; # A # Loop the prompt and run procs 3 times

sub ecx,ecx
mov ecx,3d

L1:
	
	; call locate display

	call locate

	call WaitForKey 


loop L1



; # end of code #


call crlf
call crlf

	exit
main endp

	; # 1 # Locate cursor on screen
	locate PROC
		
		; locate

		; call input

		call input
		ret
	locate ENDP


	; # 2 # Input the numbers
	input PROC

		mov edx, OFFSET inputPrompt
		call writeString
		call readInt
		mov var1, eax

		mov edx, OFFSET inputPrompt
		call writeString
		call readInt
		mov var2, eax


		;call sum and display
		call DisplaySum

		;call sub and display
		call DisplayDiff
		ret
	input ENDP


	; # 3 # Add and display the sum of values
	DisplaySum PROC
		;calculate sum of variables
		mov eax, var1
		add eax, var2

		call writeInt
		call crlf

		mov sum, eax
		ret
	DisplaySum ENDP


	; # 4 # Find difference and display value
	DisplayDiff PROC
		;calculate diff
		mov eax, var1
		sub eax, var2

		call writeInt
		call crlf

		mov difference, eax
		ret
	DisplayDiff ENDP


	; # 5 # Wait for key press
	WaitForKey PROC
		mov edx, OFFSET waitStr
		call writeString
		call readChar
		call crlf
		ret
	WaitForKey ENDP


end main

; //////////// Example run

comment !
Result of run:


!
