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

finalVal dword ?

remainder dword ?

; prompt to enter numbers

.code
main proc

  ; /////// this is where numbers are taken as input
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
  mov num3, eax
  ; //////



  ; /////// This is where main calculations occur
  mov eax,num1
  mul num1
  mul num1
  mov num1,eax

  mov eax,num2
  mul num1
  mov num1,eax

  mov eax,num2
  mul num2
  mov num2,eax

  mov ebx,5
  mov eax,num2
  mul ebx
  mov num2, eax

  mov eax,num1
  add eax,num2
  mov num1,eax

  mov eax,num1
  mov ebx,num3
  div ebx
  mov finalVal,eax
  mov remainder,edx
  call writeInt



  ; ///////



  ; /////// This is where the data is called to display




  ; ///////



	exit
main endp
end main


comment !
Result:

enter a number: 3
enter a number: 4
enter a number: 5
37
C:\Users\test\Documents\Project32_VS2017\Debug\Project.exe (process 5212) exited with code 0.
To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.
Press any key to close this window . . .

!
