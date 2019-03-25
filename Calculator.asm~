include 	REG515.INC
						
org 1000h		
	ljmp conf

org 2000h
conf:
	mov dptr, #0FFFh
	mov R0, #00h
	mov R1, #00h
	mov R2, #00h
	mov R3, #00h
	mov R4, #00h
	mov R5, #01h
next:
	inc dptr	
	movx a, @dptr
	mov b, a
	subb a, #2Bh ;czy to znak "+"	
	jz dod
	mov a, b

	subb a, #2Dh ;czy to znak "-"
	jz uj
	mov a, b
	
	subb a, #3Dh ;czy to znak "="
	jz solve
	mov a, b
			
	lcall readNumber	
	ljmp next	
	
readNumber:	
	inc R0
	clr c
	subb a, #30h
	mov @R0, a
	ret	 
dod:
	lcall calc
	mov R0, #00h
	mov R5, #01h
	ljmp next 	
uj:		
	lcall calc
	mov R0, #00h
   mov R5, #00h
   ljmp next
calc:
	mov a, R0
	jz dodaj
	dec a
	jz jeden
	dec a
	jz dwa
	dec a
	jz trzy
jeden:	
	ljmp sol
dwa:
	mov a, R1 
	mov b, #0Ah 
	mul ab ;a = a*10
	mov R1, a	 
   ljmp sol
trzy:	
	mov a, R1
	mov b, #64h 
	mul ab ;a=a*100
	mov R1, a

	mov a, R2 
	mov b, #0Ah 
	mul ab ;a=a*10
	mov R2, a
	
sol:
	mov a, R1	
	add a, R2
	add a, R3
	mov R3, a
	mov a, R5
	jb acc.0, dodaj
	mov a, R3
	jz dodaj
	cpl a
	inc a
	mov R3, a
	ljmp dodaj
dodaj:
	mov a, R3
	add a, R4
	mov R4, a
	mov R1, #00h
	mov R2, #00h
	mov R3, #00h 
	ret
solve:
	lcall calc	
	mov a, R4
	jnb acc.7, skip
	mov b, a
	mov a, #2Dh
	inc dptr
	movx @dptr, a
	mov a, b
	cpl a
	add a, #01h
	mov R4, a
skip:
	mov b, #64h
	div ab
	jz dwasol
	add a, #30h
	inc dptr
	movx @dptr, a
	mov R4, b
dwasol:
	mov a, R4
	mov b, #0Ah
	div ab
	jz jedensol
	add a, #30h
	inc dptr
	movx @dptr, a
	mov R4, b
jedensol:
	mov a, R4
	add a, #30h
	inc dptr
	movx @dptr, a
thend:	
	ljmp thend