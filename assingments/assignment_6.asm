; Assignment 6 using procedures and conditional statements to find primes

comment !

date: 11/6/19

Write a complete program that:

      1. takes number as input n
      2. finds all primes leading to n
          - use procedure isPrime to check if prime
          - print all numbers leading to n

!

include Irvine32.inc

.data
; //////////// Data storage here

; # Format and text
inputPrompt byte "enter any number: ", 0
primeStr byte "Primes found until the given number : ", 0


; # Calculation variables

.code
main proc
; /////////// Main code here

; # A # Takes input, calls functions

; Prompt input
  mov edx, OFFSET inputPrompt

  call writeString

  call readInt
  mov edi, eax

  mov edx, OFFSET primeStr
  call writeString

  ; defining loop count

	
mov ecx, 2

Lmain:
	
	mov esi, ecx
	call isPrime
	cmp ebx,0
	JE continue_loop

	xor eax,eax
	mov eax,ecx
	call writeDec

	mov eax, ' '
	call writeChar

	continue_loop:
		inc ecx
		cmp ecx, edi
		JNE Lmain
	


	exit
main endp



; # 2 # Finds and prints the prime numbers before n
; if num is prime, print it
; 1. Pass value through esi
; 2. Calculate itterations of loop
; 3. Check ecx > 1
; 4. Loop and check if value is prime
; 5. Use conditionals to set value

isPrime PROC

  ; initiate stack
  push eax
  push edx
  push ecx
  push esi

  ; calculate loop itterations
  mov eax,esi
  mov ebx, 2
  xor edx, edx
  div ebx

  mov ecx,eax

  Lprime:
    cmp ecx,1
    JE finish_prime

    mov eax,esi
    sub edx,edx
    div ecx
    cmp edx,0
    JE is_not_prime

	dec ecx

    cmp ecx,1
    JNE Lprime

	mov ebx,1
	JMP finish_prime

    is_not_prime:
      xor ebx, ebx

    finish_prime:
      pop esi
      pop ecx
      pop edx
      pop eax

ret
isPrime ENDP



end main

; //////////// Example run

comment !

Run 1:
--------------------------------------------
enter any number: 44
Primes found until the given number : 2 3 5 7 11 13 17 19 23 29 31 37 41 43
C:\Users\test\Documents\Project32_VS2017\Debug\Project.exe (process 10068) exited with code 0.
Press any key to close this window . . .

--------------------------------------------

Run 2:
--------------------------------------------
enter any number: 19
Primes found until the given number : 2 3 5 7 11 13 17
C:\Users\test\Documents\Project32_VS2017\Debug\Project.exe (process 6244) exited with code 0.
Press any key to close this window . . .

--------------------------------------------

!
