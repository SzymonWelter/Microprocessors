code	at 2000h
conf:
	mov dptr, #1000h
	movx a, @dptr 
	mov b, #2bh  
	subb a, b
	mov R3, a
	mov dptr, #1004h
	movx a, @dptr
	subb a, b
	mov R4, a
	mov R5, #03h
	mov dptr, #1001h

first:		
	movx a, @dptr
	subb a, #30h	
	add a,R0
	mov R0, a	
	dec R5	
	mov a, R5 
	jz next
	mov a, R0
	mov b, #0Ah
	mul ab
	mov R0, a
	inc dptr
	ljmp first		

next:
	mov R5, #03h	
	mov dptr, #1005h
	ljmp second

second:
	movx a, @dptr
	subb a, #30h	
	add a,R1
	mov R1, a	
	dec R5	
	mov a, R5 
	jz equation_first
	mov a, R1
	mov b, #0Ah
	mul ab
	mov R1, a
	inc dptr
	ljmp second	


equation_first:
	mov a, R3
	jnz minus_first
	mov b, #00h
	mov a, R0
	addc a,b
	mov dptr, #1008h
	movx @dptr, a
	ljmp equation_second
	
equation_second:
         mov a, R4
         jnz minus_second 
         movx a, @dptr
         mov b,a
         mov a, R1
         addc a,b
         mov dptr, #1009h
	movx @dptr, a
         ljmp equation_final                  	

equation_final:
	ljmp equation_final		

minus_first:
	mov b, #00h
	mov a, R0
	subb a,b
	mov dptr, #1008h
	movx @dptr, a
	ljmp equation_second
	
minus_second:
	movx a, @dptr				
	mov b, R1
	subb a,b
	mov dptr, #1009h
	movx @dptr, a
	ljmp equation_final
thend:	
	end
