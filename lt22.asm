.MODEL large
.DATA
	EXTRN _n: word
.CODE 
	PUBLIC @LT$qi
@LT$qi PROC
	push bp
	mov bp, sp
	mov cx, [bp + 6] 	; Giá trị biến n đưa vào cx
	mov ax, 1 			; Tích nằm trong ax 
	cmp cx, 2 			; Loại trừ trường hợp n = 0, 1
	jb L3
	L2:
		mul cx 			; ax * cx -> dx:ax (dx = 0)
		loop L2
	L3:
		pop bp
		ret 
@LT$qi ENDP
	END