TITLE worksheet 5                   

; The following class exercise is for the third week
; Topics: Assembly Fundamentals and Library Calls

; 1. Use the comment directive instead of ; for
; the first 4 lines of comments

comment !
 The following class exercise is for the third week
 Topics: Assembly Fundamentals and Library Calls

 1. Use the comment directive instead of ; for
 the first 4 lines of comments
!


; 2. Name the directives that you see in the code:
;include
;.code
;.data
;comment
;proc
;endp
;end 

INCLUDE Irvine32.inc

; 3. define a constant for the number of seconds in an hour
; by using an integer expression constant

SEC_HOUR = 60 * 60

.data
; 4. define a string: “Hello there, enter a number: ”;
myString byte "Hello there, enter a number: ", 0

; 5. define a byte and initialize with binary 110
myByte byte 110b

; 6. define a word and initialize with hexadecimal F9
myWord word 0F9h

; 7. define a doubleword and initialize with -16
myDword sdword -16

;8. define a doubleword and leave it Uninitialized
 myDword2 dword ?

; 9. define an array of 5 doublewords and initialize with the values 1,2,3
; and leaving the last 2 elements uninitialized

myArray dword 1,2,3,?,?
; or
; myArray dword 1,2,3, 2 dup (?)

.code
main PROC

; 10. write code to print the string
mov edx, offset myString
call writeString

; 11. write code to read a value and save it in the Doubleword in step
;     8 from the user   

call readDec
mov myDword2, eax
; 12. write code to store the immediate value -1 in eax
mov eax, -1
; 13. write code to print the word defined in step 6
movzx eax, myWord
; to see it in hex
 call writeHex

; 14. write code to print the doubleword defined in step 7
mov eax, myDword
call writeInt
; notice the difference if you use writeDec instead of writeInt

; 15. show what the array of 5 doublewords look like.
; Why does it look like that? open the memory window
; while you are in the debug mode. Write &myArray in the
; address area.
;0100000002000000030000000000000000000000
;little endian.

    exit   
main ENDP

END main
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
