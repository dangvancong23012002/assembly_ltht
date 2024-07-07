#include <iostream.h>
#include <conio.h>

extern ODD_SUM_ARR();
extern Exit();
void main(void) {
	char tl;
	int chon;
	PS:
		clrscr();
		cout << "\n\t      CAC BAI TAP VE MANG";
		cout << "\n\t----------------------------------";
		cout << "\n\t1...Tong cac thanh phan cua mang";
		cout << "\n\t2...Tong cac thanh phan am cua mang";
		cout << "\n\t3...Tong cac thanh phan duong cua mang";
		cout << "\n\t4...Thoat.";
		cout << "\n\t----------------------------------";
		cout << "\n\tLua chon cua ban: "; cin >> chon;
		switch(chon) {
			case 1:
				break;
			case 2:
				ODD_SUM_ARR();
				break;
			case 4:
				Exit();
				break;
			default:
				cout << "\tLua chon khong dung!!!";
				break;
		}
	cout << "\n\tCo thuc hien chuc nang khac(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto PS; 
	}
}