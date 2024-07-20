#include <iostream.h>
#include <conio.h>

extern SUM_ARR();
extern NEG_SUM_ARR();
extern POS_SUM_ARR();
extern ODD_SUM_ARR();
extern EVEN_SUM_ARR();
extern MIN_ARR();
extern MAX_ARR();
extern Exit();
void main(void) {
	char tl;
	int chon;
	PS:
		clrscr();
		cout << "\n\t           CAC BAI TAP VE MANG";
		cout << "\n\t-------------------oOo---------------------";
		cout << "\n\t1 ... Tong cac thanh phan cua mang";
		cout << "\n\t2 ... Tong cac thanh phan am cua mang";
		cout << "\n\t3 ... Tong cac thanh phan duong cua mang";
		cout << "\n\t4 ... Tong cac thanh le cua mang";
		cout << "\n\t5 ... Tong cac thanh phan chan cua mang";
		cout << "\n\t6 ... Gia tri nho nhat cua mang";
		cout << "\n\t7 ... Gia tri lon nhat cua mang";
		cout << "\n\t8 ... Thoat.";
		cout << "\n\t-------------------------------------------";
		cout << "\n\tLua chon cua ban: "; cin >> chon;
		switch(chon) {
			case 1:
				SUM_ARR();
				break;
			case 2:
				NEG_SUM_ARR();
				break;
			case 3:
				POS_SUM_ARR();
				break;
			case 4:
				ODD_SUM_ARR();
				break;
			case 5:
				EVEN_SUM_ARR();
				break;
			case 6:
				MIN_ARR();
				break;
			case 7:
				MAX_ARR();
			case 8:
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