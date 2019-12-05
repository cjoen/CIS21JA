; Assignment 8 using procedures and arrays to create 2-d arrays

comment !

date: December 5, 2019

Assignment 8
This program:


!

include Irvine32.inc

.data
; - Data storage here ----------------

; Promts and text
elemStr byte "Enter the number elements in your array:", 0
errorStr byte "Error. size must be greater than 0.", 0
rowNumStr byte "Enter the row size:",0
typeStr byte "Enter the type of your array.", 0
byteStr byte "1 for BYTE. ", 0
wordStr byte "2 for WORD. ", 0
dwordStr byte "4 for DWORD.", 0
enterStr byte "Enter a value for the array: ", 0
rowStr byte "Enter a row number to sum: ", 0
sumStr byte "Sum:", 0

; Array
table dword 40 DUP (?)  ;Note: table data type could be byte, word or dword

; Array Index
rowIndex dword ?
number_of_elem dword ?
rowSize dword ?


.code

; - Main Function -------------------
main proc

  mov edx, OFFSET elemStr  ;"Enter how many elements in your array:"
  call writeString

  call readInt             ; read in number of elements
  cmp eax, 0               ; check if eax is zero
  JE error01               ; if eax == 0, JMP to error01
  mov number_of_elem, eax  ; save to number_of_elem

  mov edx, OFFSET rowNumStr ; "Enter the row size:"
  call writeString


  call readInt           ;read in row size
  mov rowSize, eax       ;save in rowSize


  mov edx, OFFSET typeStr  ;"Enter the type of your array."
  call writeString

  call crlf

  mov edx, OFFSET byteStr ;  "1 for byte.""
  call writeString

  mov edx, OFFSET wordStr ; "2 for word."
  call writeString

  mov edx, OFFSET dwordStr  ; "4 for doubleword."
  call writeString
  call crlf

  call readInt             ;read in type of table
  mov edi, eax             ; edi == type

  mov edx, OFFSET enterStr  ;"Enter an element in your array,"

  mov esi, OFFSET table    ;esi = &table

  mov ecx, number_of_elem  ; ecx = number_of_elem

  ;loop to read in elements of table and save to memory
  readLoop:
    call writeString
    call readInt
    mov [esi], eax
    add esi, edi
    loop readloop

  mov edx, OFFSET rowStr  ;"Enter row number that you want me to sum:"
  call writeString

  call readInt            ; read in rowIndex
  mov rowIndex, eax       ;save to variable rowIndex

  sub esp, 4             ;reserve space for sum
  push rowIndex          ;push func args on stack
  push edi               ;type
  push rowSize           ;numCol
  push OFFSET table      ;&table
  call calcRowSum       ;call procedure calcRowSum
  pop eax                ;pop sum calculated to eax

  mov edx, OFFSET sumStr  ;"The sum is: "
  call writeString


  call writeHex          ;display sum
  call crlf


  JMP end01              ;JMP to end01

  error01 :              ;if number_of_elem == 0, display error string
    mov edx, OFFSET errorStr
    call writeString

  end01:

	exit
main endp


; - calcRowSum ----------------
;
;
;

calcRowSum PROC
  push ebp
  mov ebp, esp

  ;push registers on stack
  push ebx
  push eax
  push edi
  push ecx
  push edx

  mov ebx, [ebp + 8]   ;&table
  mov eax, [ebp + 12]  ; rowSize (numCols)
  mov edi, [ebp + 16]  ;type
  mov ecx, [ebp + 20]  ;rowIndex

  ;----------------------
  ;to get to appropriate row :
  ; if ebx -----> &table
  ; add ebx, rowSize * TYPE * rowIndex
  ;----------------------
  mul edi
  mul ecx

  add ebx, eax


  mov ecx, [ebp + 12]   ;loop rowSize times
  xor edx, edx          ;edx will hold the sum

  cmp edi, 1           ; if type == 1, do byte sum
  JE byteSum
  cmp edi, 2           ; if type == 2, do word sum
  JE wordSum

  dword_sum_Loop:      ;else if type == 4, dword sum
    add edx, DWORD PTR [ebx]
    add ebx, edi     ;advance ebx
  loop dword_sum_Loop
  JMP done01

  byteSum:
    byte_sum_Loop:
      add dl, BYTE PTR [ebx]  ;note : here the sum is saved in dl
      add ebx, edi
    loop byte_sum_Loop
  JMP done01

  wordSum:
    word_sum_Loop:

      add dx, WORD PTR [ebx]  ;note : here the sum is saved in dx
      add ebx, edi
    loop word_sum_Loop

  done01:
    mov [ebp + 24], edx        ;store sum on stack

    pop edx                    ;pop al registers off stack
    pop ecx
    pop edi
    pop eax
    pop ebx

    pop ebp
  ret 16                        ; (4 args * 4 = 16)
  calcRowSum endp

end main

; - Example run ----------------------------

comment !


!
