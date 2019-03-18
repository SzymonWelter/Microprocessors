org 0000h
 	ljmp start
org 1000h
start:
	;[r1,r3] * [r2,r4]
	;FAF1 × A780 = A430AF80
 	mov r1,#0FAh
 	mov r2,#0A7h
 	mov r3,#0F1h
 	mov r4,#80h

	mov 20h, #00h
	mov 21h, #00h
	mov 22h, #00h
	mov 23h, #00h
       
 	mov a,r3
 	mov b,r4
 	mul ab
 	mov 23h,a
 	mov 22h,b
       
 	mov a,r3
 	mov b, r2
 	lcall mid
       
 	mov a,r1
 	mov b,r4
 	lcall mid
       
 	mov a,r1
 	mov b,r2
 	mul ab
 	addc a,21h
 	mov 21h,a
 	mov a,b
 	addc a,20h
 	mov 20h,a
	ljmp thend
mid:
	mul ab
 	addc a,22h
 	mov 22h,a
 	mov a,b
 	addc a,21h
 	mov 21h,a
	mov a, #00h
	addc a, 20h
	mov 20h, a
	ret
thend:
	end
