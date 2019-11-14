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
  mov esi, eax

  mov edx, OFFSET primeStr
  call writeString

  call isPrime

  mov eax,esi
  call writeInt

  ; defining loop count

;  L1:



;  loop L1

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
  push ebx
  push edx
  push esi

  ; calculate loop itterations
  mov eax,esi
  mov ebx, 2
  div ebx
  mov ecx,eax

  ; if ecx > 1 then loop
  cmp ecx,1
  JBE is_prime

  Lprime:
    cmp ecx,1
    JBE is_prime

    mov eax,esi
    sub edx,edx
    div ecx
    cmp edx,0
    JE is_not_prime

    cmp ecx,1
    JNE Lprime

    is_prime:
      sub ebx,ebx
      mov ebx, 1
      clean_stack

    is_not_prime:
      sub ebx, ebx


    clean_stack:
      pop esi
      pop ebx
      pop edx
      pop esi

ret
isPrime ENDP



end main

; //////////// Example run

comment !




!
