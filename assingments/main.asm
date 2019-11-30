; Assignment 6 using procedures and conditional statements to find primes

comment !

date: November 14, 2019

Assignment 6
This program:
  1. Recieves any number as input
  2. Finds all primes before the number
  3. Prints all primes to the console

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

  mov edi, eax                      ; Storing input in edi register

  mov edx, OFFSET primeStr
  call writeString                  ; Printing primes string



; - Main Loop ----------------------
; While (ecx < edi) { ...
;   a) run isPrime function
;   b) print returned primes
; }

  mov ecx, 2                        ; Setting count for loop
  Lmain:

    mov esi, ecx                    ; Storing count in esi for isPrime fn
    call isPrime                    ; calling isPrime function
                                    ; expecting return of 0 or 1

    ; if (ebx == 0) { continue_loop() }
    cmp ebx,0                       ; conditional based on isPrime return
    JE continue_loop                ; continue loop without printing value

    xor eax,eax                     ; clear eax
    mov eax,ecx
    call writeDec                   ; print prime number

    mov eax, ' '                    ; formatting for output
    call writeChar

    continue_loop:
      inc ecx                       ; increment counter
      cmp ecx, edi                  ; check if reached target value
      JNE Lmain

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

  ; - isPrime loop ---------------
  ; count = esi/2
  mov eax,esi                     ; move value to eax
  mov ebx, 2
  xor edx, edx
  div ebx                         ; eax/2

  mov ecx,eax                     ; set count as number

  ; for ( i = count; i > 0; i-- ) { ...
  Lprime:                         ; isPrime loop
    cmp ecx,1                     ;
    JE finish_prime               ; if ( ecx == 1 ) { return true }

    mov eax,esi                   ;
    sub edx,edx                   ;
    div ecx                       ; eax/ecx
    cmp edx,0                     ; if ( remainder == 0) { return false }
    JE is_not_prime               ;

    dec ecx                       ; decrement counter

    ; if( count != 1) { continue looping }
    cmp ecx,1
    JNE Lprime

	mov ebx,1
	JMP finish_prime                ; value is a prime return 1

  is_not_prime:                   ; if value is not prime return 0
      xor ebx, ebx

  finish_prime:                   ; clean stack
      pop esi
      pop ecx
      pop edx
      pop eax

  ret

isPrime ENDP

end main

; - Example run ----------------------------

comment !

Run 1:
--------------------------------------------
enter any number: 44
Primes found until the given number : 2 3 5 7 11 13 17 19 23 29 31 37 41 43
C:\Users\test\Documents\Project32_VS2017\Debug\Project.exe (process 10068)
exited with code 0.
Press any key to close this window . . .

--------------------------------------------

Run 2:
--------------------------------------------
enter any number: 19
Primes found until the given number : 2 3 5 7 11 13 17
C:\Users\test\Documents\Project32_VS2017\Debug\Project.exe (process 6244)
exited with code 0.
Press any key to close this window . . .

--------------------------------------------

!
