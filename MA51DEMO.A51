;===============================================================================
; Program demonstracyjny DEMO1
;===============================================================================
; Opis: Rotacja punktu œwietlnego (ciemnego) na porcie P4
;	- realizacja w programie g³ównym
;	- P5.0=H - bez opóŸnieñ
;	- P5.0=L - z opóŸnieniami
;-------------------------------------------------------------------------------
include 	REG515.INC		;Tabela predefinicyjna SFR.
;-------------------------------------------------------------------------------

code at 0000
	ljmp start
						;skok do poczatku programu
code at 000bh
	ljmp 3000h
			
code	at 1000h				;organizacja od adresu 1000h
	ljmp start
	
code	at 2000h
start: 
	setb P1.0
	mov P2, #01h
	mov R1, 12h
	mov R2, #0AFh
	mov a, R2
	mov b, #1Fh
	div ab
	mov R3, a
	mov P2, #00h
	mov a,P2
petla: 	
	setb c
	rrc a
	djnz R3, petla	
	mov P2,a
		
koniec:		
END

