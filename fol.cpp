#include <iostream.h>
#include <conio.h>

void main(void) {
	char tl;
	int chon;
	PS:
		clrscr();
		cout << "\n\t     CAC BAI TAP VE THU MUC";
		cout << "\n\t-----------------------------------";
		cout << "\n\t1 ... Tao thu muc";
		cout << "\n\t2 ... Xoa thu muc rong";
		cout << "\n\t3 ... Chuyen thu muc";
		cout << "\n\t4 ... Lay ten thu muc hien hanh";
		cout << "\n\t5 ... Tro ve DOS";
		cout << "\n\t-----------------------------------";
		cout << "\n\tLua chon cua ban: "; cin >> chon;
		switch(chon) {
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
			case 4: 
				break;
			case 5:
				break;
			default:
				cout << "\n\tLua chon khong dung!!!";
				break;
		}
	cout << "\n\tCo thuc hien chuc nang khac(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto PS;
	}
}