#include <iostream.h>
#include <conio.h>

extern CARD();
extern OMEM();
extern Exit();
void main(void) {
	char tl;
	int cn;
	clrscr();
	cout << "\n\tTRUONG DAI HOC MO HA NOI";
	cout << "\n\tKHOA CONG NGHE THONG TIN";
	cout << "\n\t-----------***----------";
	cout << "\n\n\tBAI THUC HANH MON LTHT";
	cout << "\n\n\tSinh vien thuc hien: ";
	cout << "\n\tDang Van Cong - 2010A02";
	cout << "\n\n\t-------------------------";
	cout << "\n\tCo tiep tuc chuong trinh khong(c/k)?";
	tl = getch();
	if (tl == 'c') {
		do {
			
		PS:
			clrscr();
			cout << "\n\t\tCAC BAI TAP";
			cout << "\n\t-------------------------";
			cout << "\n\t1. So luong cong COM va dia chi.";
			cout << "\n\t2. So luong o mem.";
			cout << "\n\t3. Loai card dieu khien man hinh.";
			cout << "\n\t99. Thoat chuong trinh.";
			cout << "\n\t-------------------------";
			cout << "\n\tLua chon cua ban: "; cin >> cn;
			switch(cn) {
				case 1: 
					break;
				case 2:
					OMEM();
					break;
				case 3:
					CARD();
					break;
				case 99:
					Exit();
					break;
				default:
					cout << "\nLua chon khong dung!!!";
			}
		} while (cn != 0);
		cout << "\nCo thuc hien chuc nang khac (c/k)?";
		tl = getch();
		if (tl == 'c') {
			goto PS;
		}
	}
}