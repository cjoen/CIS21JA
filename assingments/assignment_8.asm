; Assignment 8 using procedures and arrays to create 2-d arrays

comment !

date: December 5, 2019

Assignment 8
This program:


!

include Irvine32.inc

.data
; - Data storage here ---------

; Promts and text
arraySizePrompt byte "Enter the number elements in your array:", 0
errorLimStr byte "Error. size must be greater than 0 and equal to or less than 40.", 0
rowSizePrompt byte "Enter the row size:",0
typePrompt byte "Enter the type of your array.", 0
typeStr byte "'1' for BYTE. '2' for WORD. '4' for DWORD.", 0
valuePrompt byte "Enter a value for the array: ", 0
rowSumPrompt byte "Enter a row number to sum: ", 0
sumStr byte "Sum: ", 0

; Array - could be byte, word, dword
table dword 40 DUP (?)

; Array Index
rowIndex dword ?
totalElements dword ?
rowSize dword ?


.code

; - Main Function -------------
main proc

  mov edx, OFFSET arraySizePrompt  ;"Enter how many elements in your array:"
  call writeString

  call readInt             ; read in number of elements

  ; if( 40 < eax || eax <= 0) { return error } else { save to totalElements}
  cmp eax, 0
  JE errorOut
  cmp eax, 40
  JA errorOut
  mov totalElements, eax  ; save to totalElements

  mov edx, OFFSET rowSizePrompt ; prompt user for row size
  call writeString


  call readInt           ;read in row size
  mov rowSize, eax       ;save in rowSize


  mov edx, OFFSET typePrompt  ; prompt user for array type
  call writeString
  call crlf

  mov edx, OFFSET typeStr ; display options for type
  call writeString
  call crlf

  call readInt             ; read in type of table
  mov edi, eax             ; set edi to type of array

  mov edx, OFFSET valuePrompt  ; prompt user for values

  mov esi, OFFSET table    ; esi = &table

  mov ecx, totalElements  ; ecx = number_of_elem

  ;loop to read in elements of table and save to memory
  readLoop:
    call writeString
    call readInt
    mov [esi], eax
    add esi, edi
    loop readloop

  mov edx, OFFSET rowSumPrompt  ;prompt user for row to sum
  call writeString

  call readInt            ; read in rowIndex
  mov rowIndex, eax       ; save to rowIndex

  sub esp, 4             ; reserve space for sum
  push rowIndex          ; push func args on stack
  push edi
  push rowSize
  push OFFSET table

  ; call and save returned value to eax
  call calcRowSum
  pop eax

  mov edx, OFFSET sumStr  ;"The sum is: "
  call writeString

  call writeHex          ;display sum
  call crlf


  JMP end              ;JMP to end

  errorOut:              ;if totalElements == 0 or > 40 display error
    mov edx, OFFSET errorLimStr ; display error for out of bounds array.
    call writeString

  end:

	exit
main endp


comment !
 - calcRowSum -----------
Steps:
  1. push registers to stack
  2. retreive values from stack
  3. Loop and sum values dependent on type of array
  4. push sum to stack
!

calcRowSum PROC
  push ebp
  mov ebp, esp

  ;push registers on stack
  push ebx
  push eax
  push edi
  push ecx
  push edx

  mov ebx, [ebp + 8]   ;&table - reference table
  mov eax, [ebp + 12]  ;rowSize - row size
  mov edi, [ebp + 16]  ;type - type of row
  mov ecx, [ebp + 20]  ;rowIndex - index of row


  comment!
  ----------------
   to get to appropriate row :
   ebx points to &table
   add ebx, rowSize * TYPE * rowIndex
  ----------------
  !

  mul edi
  mul ecx

  add ebx, eax

  mov ecx, [ebp + 12]   ; loop for rowSize
  xor edx, edx          ; edx will hold the sum


comment !
If statment C++
----------------
if(type == 1){
  for ( row ){
    sum total values
    return sum
  }

} else if (type == 2 ) {
  for ( row ){
    sum total values
    return sum
  }

} else {
  for ( row ){
    sum total values
    return sum
  }

}
!

  cmp edi, 2           ; if type == 2, do word sum
  JE sumWord
  cmp edi, 1           ; if type == 1, do byte sum
  JE sumByte

  Ldword:      ; else if type == 4, dword sum
    add edx, DWORD PTR [ebx]
    add ebx, edi     ; advance ebx
  loop Ldword
  JMP done01

  sumByte:
    Lbyte:
      add dl, BYTE PTR [ebx]  ; sum is saved in dl
      add ebx, edi
    loop Lbyte
  JMP done01

  sumWord:
    Lword:

      add dx, WORD PTR [ebx]  ; sum is saved in dx
      add ebx, edi
    loop Lword

  done01:
    mov [ebp + 24], edx        ; store sum on stack

    pop edx                    ; pop al registers off stack
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
