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

sumText byte "The sum is: ", 0
meanText byte "The mean is: ", 0
remText byte " and ", 0
rem2Text byte "/10 ", 0
arrTag byte "The original array: ", 0
arrRot byte "After a rotation: ", 0
arrFormat byte " ", 0

; # Array for numbers
arr dword 10 dup(?)

; # Calculation variables
arrSum dword ?
arrMean dword ?
arrRem dword ?
mCount dword ?
sCount dword ?
pCount dword 10

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


; # 3 # Sum all variables and print

mov edi,OFFSET arr
mov ecx, LENGTHOF arr
sub eax,eax
L2:
  add eax,[edi]
  add edi, type arr

loop L2

mov arrSum, eax

;Display sum
mov edx, OFFSET Sumtext
call writeString
mov eax,arrSum
call writeDec

call crlf

; # 4 # Find mean value and Print

;Calculating mean value
sub edx,edx
mov ebx, 10
div ebx

; Storing mean and remainder value for later
mov arrMean, eax
mov arrRem, edx

; Display Mean and remainder
mov edx, OFFSET meanText
call writeString
mov eax,arrMean
call writeDec

mov edx, OFFSET remText
call writeString
mov eax,arrRem
call writeDec
mov edx, OFFSET rem2Text
call writeString

call crlf


; # 2 # Print array in order

mov edi, OFFSET arr
mov ecx, LENGTHOF arr
mov edx, OFFSET arrTag

call writeString
Lprint:
	mov eax,[edi]
	call writeDec
	mov edx, OFFSET arrFormat
	call writeString
	add edi, type arr
	
loop Lprint

call crlf

; # 5 # Rotate vairable to reverse the array

mov ecx, 9
mov sCount, 9

Lmain:

mov mCount, ecx
mov ecx, sCount
mov ebx, 9
mov edi, OFFSET arr

;add sub loop for rotations
Lsub:
	mov eax, [edi + ebx*4]

	xchg eax, [edi + ebx*4 - 4]

	mov [edi + ebx*4], eax

	dec ebx

loop Lsub

dec sCount

; ### Setting variable for printing
mov edi, OFFSET arr
mov ecx, LENGTHOF arr
mov edx, OFFSET arrRot

call writeString

; looping to print array
Lp:
	mov eax,[edi]
	call writeDec
	mov edx, OFFSET arrFormat
	call writeString
	add edi, type arr
loop Lp

; ### Setting count back to main
mov ecx,mCount

;formatting for new line
call crlf
loop Lmain

;display rotation - need to be placed in the loop


;# end of code #


call crlf
call crlf

	exit
main endp
end main




comment !
Result of run:


!
