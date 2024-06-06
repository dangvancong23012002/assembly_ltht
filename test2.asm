.MODEL small
.STACK 100h
.DATA
	Am db 13, 10, 'Nho hon 0 $'
	Duong db 13, 10, 'Lon hon 0 $'
	Khong db 13, 10, 'Bang 0 $'
.CODE
PS:
	mov ax, @data
	mov ds, ax 
	mov ax, 4
	mov bx, 5
	sub ax, bx 
HIEN_SO:
	mov  BX,10	; BX chua so chia la 10
	xor  CX,CX	; So lan cat vao stack (luc dau = 0)
	and  AX,AX	; Dung co dau SF
	jns  HSN1	; Neu so can hien la duong thi nhay
	push AX		; con khong thi cat AX vao stack
	mov  AL,'-'	; Hien dau '-' ra man hinh
	mov  AH,0eh
	int  10h
	pop  AX		; Hoi phuc lai so can hien tu stack vao AX
	neg  AX		; Bu 2 de lay gia tri tuyet doi
   HSN1:
	xor  DX,DX	; DX=0
	div  BX		; DX:AX chia cho BX (10)
	add  DX,30h	; Chuyen so du tu dang so ra dang ASCII
	push DX		; Cat vao stack
	inc  CX		; Tang so lan cat vao stack len 1
	and  AX,AX	; Dung co ZF (lieu thuong = 0)
	jnz  HSN1	; Thuong # 0 thi nhay den tiep tuc qua trinh chia
   HSN2:		; Vong lap lay cac gia tri co trong stack hien 
	pop  AX		
	mov  AH,0eh	; Chuc nang hien 1 ky tu dang ASCII o AL ra man hinh
	int  10h
	loop HSN2
	
	;cmp ax, 0
	;jne Khong0
	and ax, ax ; Giá trị là âm hay dương
	jne Duong0
	jmp Am0
	
	jne Exit
	;jb Am0
	
	Duong0:
		mov ah, 9
		lea dx, Duong
		int 21h
	Am0:
		mov ah, 9
		lea dx, Am
		int 21h
	
	;Khong0:
		;mov ah, 9
		;lea	dx, Khong
		;int 21h
	Exit:
		mov ah, 4ch
		int 21h
END PS