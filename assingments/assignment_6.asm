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
var1 dword ?

.code
main proc
; /////////// Main code here

; # A # Takes input, calls functions

; Prompt input
mov edx, OFFSET inputPrompt
call writeString
call readInt
mov var1,eax


mov edx, OFFSET primeStr
call writeString

; Check number

call checkNum


	exit
main endp

; # 1 # Loops through numbers leading up to n
checkNum PROC

mov ecx,var1
L1:

 mov eax,ecx

 call isPrime

loop L1



    ret
checkNum ENDP



; # 2 # Finds and prints the prime numbers before n
; if num is prime, print it
isPrime PROC

  run is prime on eax
;
;
;
;
;

; Print eax if the value is prime

		ret
isPrime ENDP



end main

; //////////// Example run

comment !




!
