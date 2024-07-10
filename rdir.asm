INCLUDE lib1.asm 
.MODEL small 
.STACK 100h
.DATA
	m 	db 13, 10, '	     CHUC NANG XOA THU MUC RONG'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao thu muc can xoa: $'
	err_md db 13, 10, '	Khong xoa duoc thu muc! $'
	suc_md db 13, 10, '	Xoa thu muc thanh cong! $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	buff 	db 40
			db ?
	dir_name db 40 dup(?)
.CODE
	PUBLIC @REM_DIR$qv
@REM_DIR$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString m 
		lea dx, buff ; ds:dx trỏ đến đầu buff 
		call GET_DIR_NAME ; Gọi hàm nhận tên thư mục cần tạo 
		lea dx, dir_name ; dx trỏ đến đầu xâu chứa tên thư mục
		mov ah, 3AH
		int 21h
		jnc L_CT1
		HienString err_md
		jmp CONTINUE
		
	L_CT1:
		HienString suc_md
		
	CONTINUE:
		HienString tieptuc
		mov ah, 1
		int 21h
		cmp al, 'c'
		jne Exit
		jmp L_CT0
	
	Exit:
		mov ah, 4ch
		int 21h
		
	ret
	
INCLUDE lib3.asm 
@REM_DIR$qv ENDP
	END