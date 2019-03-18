org 000h
	ljmp conf
org 1000h
conf:		
	mov R0, #8Eh
	lcall zmToU2
	mov R1, a
	lcall negU2
	mov R2, a
	lcall U2addU2
	mov R3, a
	ljmp thend	
zmToU2:
	mov a, R0
	jnb acc.7, U2
	cpl acc.7
	jz U2
	cpl a
	inc a
	ret
negU2:
	mov a, R1
	cpl a
	inc a
	ret
U2addU2:
	mov a, R1
	add a, R2 
	ret
U2:
	ret
thend:	
	end
