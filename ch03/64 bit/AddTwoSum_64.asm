; AddTwoSum_64.asm - Chapter 3 example.

;ExitProcess PROTO dwExitCode:word
ExitProcess proto

.data
sum qword 0

.code
main proc
	mov	rax,5
	add	rax,6
	mov   sum,rax

	mov   ecx,0
	call  ExitProcess

	;invoke  ExitProcess,0		; INVOKE not permitted!
main endp
end								; entry point cannot be specified
