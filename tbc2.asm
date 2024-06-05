.MODEL large
.DATA
EXTRN _so1: word, _so2: word, _flag: word
.CODE
	PUBLIC @AVG$qv
@AVG$qv PROC
	mov ax, _so1 	; ax = so1
	mov bx, _so2 	; bx = so2 
	add ax, bx 		; ax = ax + bx (ax = so1 + so2)
	sar ax, 1 		; ax = chia đôi làm tròn dưới
	jnc L1 			; Nếu tổng là chẵn (C=0) thì nhảy đến L1
	mov cx, 1 		; Còn không thì biến cờ flag = 1
	mov _flag, cx
	L1:
		ret
@AVG$qv ENDP
	END