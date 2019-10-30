; Assignment 4 loops and arrays

comment !

name: Christopher Owen
date: 10/16/19
goal: take the input of 3 numbers and manipulate based on assinged caculations

!


include Irvine32.inc

.data
; //////////// Data storage here

inputPrompt byte "enter a number: ", 0

sumText byte "Sum value: ", 0
meanText byte "Mean value: ", 0
arrTag byte "Array: ", 0
arrFormat byte ", ", 0

; # Array for numbers
arr dword 10 dup(?)

; # Calculation variables
arrSum dword ?
arrMean dword ?
arrRem dword ?


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


; # 2 # Print array in order

mov edi, OFFSET arr
mov ecx, LENGTHOF arr
mov edx, OFFSET arrTag

call writeString
Lprint:
	mov 

loop Lprint

; # 3 # Sum all variables and print

mov edi,OFFSET arr
mov ecx, LENGTHOF arr
sub eax,eax
L2:
  add eax,[edi]
  add edi, type arr

loop L2

call writeDec
call crlf

mov arrSum, eax

; # 4 # Find mean value and Print

sub edx,edx
mov ebx, 10
div ebx
call writeDec   ; Mainly for debugging
call crlf

mov arrMean, eax
mov eax,edx
call writeDec   ; Mainly for debugging
call crlf

mov arrRem, eax

;mov edx,Sumtext
;call writeString
mov eax,arrSum
call writeDec

; # 5 # Rotate vairable to reverse the array



	exit
main endp
end main




comment !
Result of run:


!
