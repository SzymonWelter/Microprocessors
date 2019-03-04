org 0000h
	ljmp start

org 1000h
start:
	mov TMOD, #01h
	setb TR0
	setb ET0
	setb EA
main:
	ljmp main

org 000Bh
	ljmp przerw

org 2000h
przerw:
	mov TL0, #253
	mov TH0, #4Bh
	cpl P0.0
reti

	