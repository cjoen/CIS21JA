; Assignment 5 other procedures in assembly

comment !

date: 11/6/19

Write a complete program that:

		1. loops 3 times
		 2. Clears screen
		 3. prompts user for 2 signed numbers
		 4. displays sum and difference
		 5. uses irvine library
		 6. uses procedures

!

include Irvine32.inc

.data
; //////////// Data storage here

; # Format and text
inputPrompt byte "enter any number: ", 0
waitStr byte "Press any key to continue...", 0
sumStr byte "sum: ", 0
diffStr byte "difference: ", 0


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

	exit
main endp


; # 1 # Locate cursor on screen and call input process
locate PROC

		; Position cursor
		mov   dh,15 ; row 15
		mov   dl,40 ; column 40
		call  Gotoxy; locate cursor

		; call input process
		call input

		ret
locate ENDP


; # 2 # Prompt user and recieve input
;				Also calls DisplaySum and DisplayDiff
input PROC
		sub eax,eax

		; Store var 1
		mov edx, OFFSET inputPrompt
		call writeString
		call readInt
		mov var1, eax

		; Position cursor
		mov   dh,16 ; row 16
		mov   dl,40 ; column 40
		call  Gotoxy; locate cursor

		; Store var 2
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

		; Position cursor
		mov   dh,17 ; row 17
		mov   dl,40 ; column 40
		call  Gotoxy; locate cursor

		;calculate sum of variables
		mov eax, var1
		add eax, var2

		; display sum of variables
		mov edx, OFFSET sumStr
		call writeString
		call writeInt

		mov sum, eax

		ret
DisplaySum ENDP


; # 4 # Find difference and display value
DisplayDiff PROC

		; Position cursor
		mov   dh,18 ; row 18
		mov   dl,40 ; column 40
		call  Gotoxy; locate cursor

		; calculate diff
		mov eax, var1
		sub eax, var2

		; display difference
		mov edx, OFFSET diffStr
		call writeString
		call writeInt

		mov difference, eax
		ret
DisplayDiff ENDP


; # 5 # Wait for key press
WaitForKey PROC

		; Position cursor
		mov   dh,19 ; row 19
		mov   dl,40 ; column 40
		call  Gotoxy; locate cursor

		; prompt for keypress to continue
		mov edx, OFFSET waitStr
		call writeString
		call readChar
		call Clrscr

		ret
WaitForKey ENDP


end main

; //////////// Example run

comment !
Result of run:

enter a number: 12
enter a number: -16
sum: -4
difference: +28
Press any key to continue...

!

if ( w == 1 &&  x != 2)

     y--;

else

    x++;


cmp w,1
JNE L1

cmp w,2
JE L2

L1:


L2:
