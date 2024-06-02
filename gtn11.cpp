#include <iostream.h>
#include <conio.h>

extern int GT(int i1);
void main(void) {
	char tl;
	L1:
	int n;
		clrscr();
		cout << "\nLIEN KET VOI NGON NGU BAC CAO(C++)";
		cout << "\n----------------------------------";
		cout << "\n\nBai 2: Viet chuong trinh tinh n! (n tu 0 den 7)";
		cout << "\nvoi su phan cong sau: ";
		cout << "\n* Module C++:";
		cout << "\n - Nhan gia tri n,";
		cout << "\n - Goi ham tinh n! do Assembly viet va hien ket qua";
		cout << "\n* Module Assembly: Viet ham tinh n!.";
		cout << "\n\n-----------------------------------";
		cout << "\nCach 2: Ham Assembly co 1 doi (n la tham so thuc).";
		cout << "\n----------CHUONG TRINH-------------";
		cout << "\nHay vao n: "; cin >> n;
		cout << "Giai thua cua " << n << " la: " << GT(n);
		cout << "\n-----------------------------------";
	cout << "\nCo tiep tuc(c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}