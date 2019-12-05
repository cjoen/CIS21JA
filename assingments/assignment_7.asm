Title Assignment 7

COMMENT !

Assingment:
  Ask user for up to 40 elements in an unsigned integer array
  Display array before sort
  Display array after sort

*****************
date: 11/29/2019
*****************
!

include irvine32.inc
; ===============================================
.data

array dword 40 dup(?)
arr_length dword ?
inputPrompt BYTE "Enter up to 40 unsigned integers:", 0
inititalArr BYTE "These are the numbers stored in the array: ". 0
finalArr BYTE "These are the numbers after being sorted: ". 0
continue BYTE "Press any key to continue...", 0

;=================================================
.code
main proc

  mov edx, offset inputPrompt
  call writeString
  call crlf

  ; - call enter_elem -
  push offset array
  call enter_elem
  pop arr_length
  call crlf
  call crlf

  ; - call print_arr -
  mov edx, offset inititalArr
  call writeString
  call crlf

  push offset array
  push arr_length
  call print_arr
  call crlf

  ; - call sort_arr -
  push offset array
  push arr_length
  call sort_arr

  ; - call print_arr -
  mov edx, offset finalArr
  call writeString
  call crlf
  push offset array
  push arr_length
  call print_arr
  call crlf

  ; - finish -
  mov edx, offset continue
  call writeString
  call readChar

   exit
main endp

; ================================================
; void enter_elem(arr_addr)
;
; Input:
;   ARR_ADDRESS THROUGH THE STACK
; Output:
;   ARR_LENGTH THROUGH THE STACK
; Operation:
;   Fill the array and count the number of elements
;
enter_elem proc

  push ebp
  mov ebp, esp
  push ebx
  push ecx
  push eax

  mov ebx, [ebp+8]
  xor ecx, ecx

  comment!
  code in c++:
    while ( ecx < 40){
      {
    		eax = readInt();
    		if( eax == 0 )
    			break;
    		else
    		{
    			[ebx] = eax;
    			ebx += dword;
    			ecx++;
    		}
    }
  !

  InputL:
    cmp ecx, 40
    jGE endLoop
    call readInt
    cmp eax, 0
    jE endLoop
    mov [ebx], eax
    add ebx, DWORD
    inc ecx
    jmp InputL

  endLoop:

  pop eax
  mov [ebx+8], ecx
  pop ecx
  pop ebx
  pop ebp
  ret

enter_elem endp

; ================================================
; void print_arr(arr_addr,arr_len)
;
; Input:
;   Array address and length in the stack
; Output:
;   N/A
; Operation:
;  print out the array
;

print_arr proc

  push ebp
  mov ebp, esp
  push edx
  push ecx
  push ebx
  push eax

  mov edx, [ebp + 12] ; the array offset
  mov ecx, [ebp + 8]; the array length
  xor ebx, ebx

  comment!
  conditional c++ code
  ; printing each element from the array
  while(ebx < ecx)
  {
    cout << [edx];
    cout << endl;
    edx += 4
  !

  printLoop:
		cmp ebx, ecx
		JGE outLoop

		mov eax, [edx]
		call writeDec
		mov eax, ' '
		call writeChar
		add edx, DWORD
		inc ebx
		jmp printLoop
	outLoop:

	pop eax
	pop ebx
	pop ecx
	pop edx
	pop ebp

	ret 8
print_arr endp

; ================================================
; void sort_arr(arr_addr,arr_len)
;
; Input:
;   array address and length in stack
; Output:
;   none
; Operation:
;   sort the array
;

sort_arr proc

  push ebp
  mov ebp, esp
  push edx
  push ecx
  push ebx
  push eax
  push edi

  mov ecx, [ebp + 8]; the array length
  ; ecx = ecx * 4 ; to get the length in bytes not dword
  mov eax, ecx
  xor edx, edx
  mov ecx, 4
  mul ecx
  mov ecx, eax

  mov edx, [ebp + 12] ; the array offset
  xor ebx, ebx  ; ebx will be used in inner loop
  xor eax, eax  ; eax will be used in outer loop
  xor edi, edi  ; esi will be used to save maxindex location

  comment!
  c++ code of proc
  while(eax < ecx)
	{
		ebx = eax; // check location for swap
		edi = ebx; // max num index
		while(ebx < ecx)
		{
			if(array[ebx] > array[edi])
				edi = ebx;
			ebx++;
		}
		compare and swap ( array[eax], array[edi]);

		eax++;
	}
  !

  startSort:
		cmp eax, ecx
		jGE outSort

		mov ebx, eax
		mov edi, ebx

		searchMaxIndex:
			cmp ebx, ecx
			jGE outSearch
			push eax
			mov eax, [edx + ebx]
			cmp eax, [edx + edi]
			pop eax
			jLE notMax
			mov edi, ebx
			notMax:
			add ebx, dword
		jmp searchMaxIndex
		outSearch:

		add edx, eax
		push edx
		sub edx, eax

		add edx, edi
		push edx
		sub edx, edi
		call compare_and_swap

		add eax, dword
		jmp startSort
	outSort:

	pop edi
	pop eax
	pop ebx
	pop ecx
	pop edx
	pop ebp

	ret 8

sort_arr endp

; ===============================================
; void compare_and_swap(x_addr,y_addr)
;
; Input:
;   x and y address in stack
; Output:
;   none
; Operation:
;  compare and call SWAP ONLY IF Y > X
;

compare_and_swap proc

  push ebp
  mov ebp, esp
  push eax
  push ebx
  push ecx
  push edx
  mov eax, [ebp + 12] ; x address
  mov ebx, [ebp + 8]  ; y address

  mov ecx, [eax] ; ecx has x value
  mov edx, [ebx] ; edx has y value
  cmp ecx, edx
  jGE dontSwap
    push eax
    push ebx
    call swap
  dontSwap:

  pop edx
  pop ecx
  pop ebx
  pop eax
  pop ebp

  ret 8
compare_and_swap endp

; =================================================
; void swap(x_addr,y_addr)
;
; Input:
;   x and y address in stack
; Output:
;   none
; Operation:
;  swap the two inputs
;

swap proc

  push ebp
  mov ebp, esp
  push eax
  push ebx
  push ecx
  push edx
  mov eax, [ebp + 12] ; x address
  mov ebx, [ebp + 8]  ; y address

  mov ecx, [eax] ; ecx has x value
  mov edx, [ebx] ; edx has y value
  mov [eax], edx ; x address gets y value
  mov [ebx], ecx ; y address gets x value

  pop edx
  pop ecx
  pop ebx
  pop eax
  pop ebp

  ret 8

swap endp

end main


comment!

output of code:
---------------
Enter up to 40 unsigned dword integers. To end the array, enter 0.
After each element press enter.
1
2
3
4
6
7
8
0


Your initial array:
1 2 3 4 6 7 8
Your array sorted in descending order:
8 7 6 4 3 2 1
Press any key to continue...



!
