.MODEL large
.DATA
EXTRN _a: word, _n: word
.CODE
PUBLIC @LT$qv
@LT$qv  PROC
	mov bx, _a    	; bx = a
	mov cx, _n		; cx = n
	mov ax, 1		; ax = 1
	and cx, cx		; Dựng cờ để xét liệu n = 0
	jz L2			; Nếu n = 0 thì nhảy đến L2
    L1:
		mul bx		; còn n # 0 thì tiến hành vòng lặp tính an  
		loop L1
    L2:
		ret
@LT$qv  ENDP
		END