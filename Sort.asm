org 0000h
	ljmp start
org 1000h
start:
	mov r0, #30h
	mov r2, #37h
	mov a, r2
	subb a, r0
	mov r4, a 
next:
	mov a, r0
	mov r1, a
	inc r0
	mov a, @r0
	subb a, @r1
	jnc cont
	mov b, @r0
	mov a, @r1
	mov @r1, b
	mov @r0, a
cont:		
	mov a, r2
	xrl a, r0	
	jnz next
	djnz r4, back
thend:
	ljmp thend
back:	
	mov r0, #30h
	ljmp next
	
