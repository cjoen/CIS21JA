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
	cmp ebx,1
	JNE continue_loop

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

  call crlf
  call writeInt
  call crlf

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




!
