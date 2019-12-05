; Assignment 6 using procedures and conditional statements to find primes

comment !

date: December 5, 2019

Assignment 8
This program:


!

include Irvine32.inc

.data
; - Data storage here ----------------

; Promts and text
inputPrompt byte "enter any number: ", 0
primeStr byte "Primes found until the given number : ", 0

.code
main proc


; - Main Function -------------------

  mov edx, OFFSET inputPrompt
  call writeString                  ; Making user input request
  call readInt




; - Main Loop ----------------------
; While (ecx < edi) { ...
;   a) run isPrime function
;   b) print returned primes
; }


	exit
main endp


; - isPrime Function ----------------
; Calculates whether a number is a prime
; the value is passed through the esi register
; the function returns a 0 or 1 based on whether it is a prime

isPrime PROC

  ; push used registers to stack
  push eax
  push edx
  push ecx
  push esi

  ; - isPrime function ---------------




  ; clean stack
  finish_prime:
      pop esi
      pop ecx
      pop edx
      pop eax

  ret

isPrime ENDP

end main

; - Example run ----------------------------

comment !


!
