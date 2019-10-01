; 64-bit Assembly Language template 

ExitProcess proto
ReadString proto
WriteString proto
Crlf proto

.data
; Declare your variables here.
buffer BYTE 50 dup(0)

.code
main proc
	mov   rdx,offset buffer
	mov   rcx,48
	call  ReadString
	call  WriteString
	call  Crlf

	mov   ecx,0			; assign a process return code
	call  ExitProcess	; terminate the program
main endp
end
