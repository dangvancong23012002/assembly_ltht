.MODEL large
.DATA
	EXTRN _n: word
.CODE 
	PUBLIC @LT$qi
@LT$qi PROC
	push bp
	mov bp, sp
	mov bx, [bp + 6] 	; bx = a (lấy giá trị a trong stack đưa vào bx) 
	mov cx, _n 			; cx = n 
	mov ax, 1 			; Tích nằm trong ax 
	and cx, cx 			; Dựng cờ để xét liệu n có bằng 0
	jz L2 				; Nếu n = 0 thì nhảy đến L2 
	L1:
		mul bx 			; còn n # 0 thì tiến hành vòng lặp tính a mũ n 
		loop L1
	L2:
		pop bp 			; Hồi phục giá trị của bp
		ret 
@LT$qi ENDP
	END