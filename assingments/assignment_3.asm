; Assignment 3 assembly calculations

comment !

name: Christopher Owen
date: 10/16/19
goal: take the input of 3 numbers and manipulate based on assinged caculations

!


include Irvine32.inc

.data
greeting BYTE "hello world", 0ah, 0dh, 0

num1 dword 2
num2 dword 3
num3 dword 4

; prompt to enter numbers

.code
main proc
	mov edx, OFFSET greeting
	call writeString

	mov	eax,5
	add	eax,6

  ; /////// this is where numbers are taken as input


  ; //////



  ; /////// This is where main calculations occur
  mov eax,num1
  mov edx,num1
  mul eax,edx
  mov num1,eax

  call num1
  ; ///////



  ; /////// This is where the data is called to display


  ; ///////



	exit
main endp
end main


comment !
Result:


!
