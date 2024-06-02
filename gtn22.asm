.MODEL large
.CODE
	PUBLIC @GT$qi
@GT$qi PROC
	push bp
	mov bp, sp
	mov cx, [bp + 6] 	; cx = a (lấy giá trị n trong stack đưa vào cx)
	mov ax, 1 			; ax = 1
	cmp cx, 2 			; So sánh m < 0 (tức là n = 0 hoặc n = 1)
	jb L2 				; Nếu n < 0 thì nhảy đến L2 
	L1:
		mul cx 			; còn n >= 0 thì tiến hành vòng lặp tính n!
		loop L1
	L2:
		pop bp 			; Hồi phục giá trị BP
		ret 
@GT$qi ENDP
	END