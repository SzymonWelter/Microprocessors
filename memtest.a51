include 	REG515.INC

code at 0000h
	ljmp 1000h
	
code at 1000h
	mov a, #00h
loop:
	mov dptr, #3000h
	lcall write	
	mov dptr, #3000h
	mov b, a
	lcall read
	inc a	
	cjne a, #00h, loop	
main:
	ljmp main 
write:
	movx @dptr, a
	inc dptr
	mov R0, dph	
	cjne R0, #00h, write
	ret
read:
	movx a, @dptr
	cjne a, b, err
	inc dptr
	mov R0, dph	
	cjne R0, #00h, read
	mov a, b
	ret
err:
	mov P4, DPH
	mov P5, a
	ljmp err
