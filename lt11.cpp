#include <iostream.h>
#include <conio.h>
int a,n;
extern int LT(int i1);
void main(void)
{
	char tl;
	L1:
	int a;
		clrscr();
		cout << "\nLIEN KET VOI NGON NGU BAC CAO(C++)";
		cout << "\n----------------------------------";
		cout << "\n\nBai tap: Viet chuong trinh tinh a mu n (a: nguyen duong, n: nguyen duong) ";
		cout << "\nvoi su phan cong sau: ";
		cout << "\n* Module C++:";
		cout << "\n - Nhan gia tri a va n,";
		cout << "\n - Goi ham tinh a mu n do Assembly viet va hien ket qua";
		cout << "\n* Module Assembly: Viet ham tinh a mu n.";
		cout << "\n\n-----------------------------------";
		cout << "\nCach 2: Ham Assembly co 1 doi. Gia tri bien a la tham so thuc cua ham \n(se duoc dua vao ngan xep, con n van la bien \ntoan cuc.";
		cout << "\n----------CHUONG TRINH-------------";
		cout << "\nHay vao a : "; cin >> a;
		cout << "Hay vao n : "; cin >> n;
		cout << a << " luy thua " << n << " la : " << LT(a);
		cout << "\n-----------------------------------";
	cout << "\nCo tiep tuc(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}