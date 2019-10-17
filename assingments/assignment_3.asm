; Assignment 3 assembly calculations

comment !

name: Christopher Owen
date: 10/16/19
goal: take the input of 3 numbers and manipulate based on assinged caculations

!


include Irvine32.inc

.data
greeting BYTE "hello world", 0ah, 0dh, 0

num1 DWORD 2d
num2 DWORD 3d
num3 DWORD 4d
finalVal DWORD ?

; prompt to enter numbers

.code
main proc
	mov edx, OFFSET greeting
	call writeString

	mov	eax,5
	add	eax,6
	call writeInt

  ; /////// this is where numbers are taken as input


  ; //////



  ; /////// This is where main calculations occur
  mov eax,num1
  mul eax,num1
  mov num1,eax

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
