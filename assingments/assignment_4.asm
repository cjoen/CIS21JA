; Assignment 4 loops and arrays

comment !

date: 10/30/19

Write a complete program that:
    1. Prompt the user to enter 10 numbers.
    2. save those numbers in a 32-bit integer array.
    3. Print the array with the same order it was entered.
    3. Calculate the sum of the numbers and display it.
    4. Calculate the mean of the array and display it.
    5. Rotate the members in the array forward one position for
       9 times. so the last rotation will display the array in reversed order.
    6. Print the array after each rotation.
       check the sample run.

!


include Irvine32.inc

.data
; //////////// Data storage here

; # Format and text
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

; # Loop/count variables
rotationC dword 9
mCount dword 9
sCount dword 9
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


; # 2 # Sum all variables and print

mov edi,OFFSET arr
mov ecx, LENGTHOF arr
sub eax,eax
L2:
  add eax,[edi]
  add edi, type arr

loop L2

mov arrSum, eax

; Display sum
mov edx, OFFSET Sumtext
call writeString
mov eax,arrSum
call writeDec

call crlf

; # 3 # Find mean value and Print

;Calculating mean value
sub edx,edx
mov ebx, LENGTHOF arr
div ebx

; Storing mean and remainder value
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


; # 4 # Print array in order

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

mov ecx, mCount

Lmain:

mov mCount, ecx
mov ecx, sCount
mov ebx, rotationC
mov edi, OFFSET arr

;Sub loop exchanges values in array
Lsub:
	mov eax, [edi + ebx*4]

	xchg eax, [edi + ebx*4 - 4]

	mov [edi + ebx*4], eax

	dec ebx

loop Lsub

dec sCount

; ### Setting variables for printing
mov edi, OFFSET arr
mov ecx, LENGTHOF arr
mov edx, OFFSET arrRot

call writeString

; Loop to print the arrays
Lprint:
	mov eax,[edi]
	call writeDec
	mov edx, OFFSET arrFormat
	call writeString
	add edi, type arr
loop Lprint

; ### Setting count back to main
mov ecx,mCount

; formatting for new line
call crlf
loop Lmain

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
