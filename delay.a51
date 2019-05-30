include 	REG515.INC
						
code	at 1000h				
	ljmp conf	
code	at 100Bh ; Timer 0 overflow
    ljmp measure

code at 2000h
conf:
	setb EAL
	setb ET0
	mov TMOD, #00000001b
	mov ADCON, #00001000b
	mov DAPR, #00h
	setb TR0
    clr P1.3
	clr P1.2
    mov R0, #00h
    mov R1, #30h
    mov R2, #A0h
sleep:
    jnb F1, sleep
write:
    mov DPH, R2
    mov DPL, R0
    movx @DPTR, a
    inc DPTR
    mov R2, DPH
    cjne R2, #0EFh, read
    mov R2, #30h

read:
    mov DPH, R1
    mov DPL, R0
    movx a, @DPTR
    mov P4, a
    inc DPTR
    mov R1, DPH
    mov R0, DPL
    cjne R1, #0EFh, finish
    mov R1, #30h

 finish:
    clr F1
    ljmp sleep

measure:
    mov a, ADDAT 
    mov TH0, #0F0h
    setb F1
    reti