; Assignment 3 assembly calculations

comment !

name: Christopher Owen
date: 10/16/19
goal: take the input of 3 numbers and manipulate based on assinged caculations

!


include Irvine32.inc

.data
inputPrompt byte "enter a number: ", 0

num1 dword ?

num2 dword ?

num3 dword ?

; prompt to enter numbers

.code
main proc
	mov edx, OFFSET inputPrompt
	call writeString


  call readDec
  mov num1, eax

  ; //////

  mov edx, OFFSET inputPrompt
  call writeString

  call readDec
  mov num2, eax

  ; //////

  mov edx, OFFSET inputPrompt
	call writeString


  call readDec
  mov num1, eax

  ; //////

	mov	eax,5
	add	eax,6
  call writeInt

  ; /////// this is where numbers are taken as input


  ; //////



  ; /////// This is where main calculations occur
  mov eax,num1
  call writeInt
  ; ///////



  ; /////// This is where the data is called to display


  ; ///////



	exit
main endp
end main


comment !
Result:


!
