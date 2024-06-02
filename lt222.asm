.MODEL large
.CODE
	PUBLIC @LT$qii
@LT$qii PROC
	push bp
	mov bp, sp
	mov bx, [bp + 6] 	; bx = a (lấy giá trị a trong stack đưa vào bx)
	mov cx, [bp + 8] 	; cx = n (lấy giá trị n trong stack đưa vào cx)
	mov ax, 1 			; ax = 1
	and cx, cx 			; Dựng cờ để xét liệu n có = 0
	jz L2 				; Nếu n = 0 thì nhảy đến L2 
	L1:
		mul bx 			; Còn n # 0 thì tiến hành vòng lặp tính a mũ n 
		loop L1
	L2:	
		pop bp 			; Hồi phục giá trị bp 
		ret
@LT$qii ENDP
	END