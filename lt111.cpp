#include <iostream.h>
#include <conio.h>

extern int LT(int i1, int i2);
void main(void) {
	char tl;
	L1:
	int a, n;
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
		cout << "\nCach 3: Ham Assembly co hai doi (a va n deu la tham so thuc).";
		cout << "\n----------CHUONG TRINH-------------";
		cout << "\nHay vao a: "; cin >> a;
		cout << "Hay vao n: "; cin >> n;
		cout << a << " luy thua " << n << " la: " << LT(a, n);
		cout << "\n-----------------------------------";
	cout << "\nCo tiep tuc(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}