#include <iostream.h>
#include <conio.h>

int n, a[100];
extern int min_value;
extern int min_index;
extern int GTNN();
extern int VTNN();
extern int SAPXEP();
void main(void) {
	char tl;
	L1:
		clrscr();
		cout << "\nTHUC HANH TREN LOP (NGAY 20-6-2024)";
		cout << "\n---------------***-----------------";
		cout << "\n1. Tim va hien gia tri be nhat cua day so nguyen.";
		cout << "\n2. Vi tri gia tri be nhat cua day so nguyen.";
		cout << "\n3. Sap xep day so theo thu tu giam dan.";
		cout << "\n-----------------------------------";
		cout << "\n\n--------- CHUONG TRINH -------------";
		cout << "\nNhap vao so luong thanh phan: "; cin >> n;
		for (int i = 0; i < n; i++) {
			cout << "a[" << i << "]="; cin >> a[i];
		}
		
		// In ra màn hình dãy số vừa nhập
		cout << "Day so vua nhap la: ";
		for (int j = 0; j < n; j++) {
			cout << a[j] << " ";
		}
		
		// Tìm số nhỏ nhất của dãy 
		GTNN();
		cout << "\nSo nho nhat cua day la: " << min_value;
		
		// Vị trí nhỏ nhất của dãy số
		VTNN();
		cout << "\nVi tri nho nhat cua day so la: " << min_index;
		
		// Gọi hàm sắp xếp
		SAPXEP();
		// In ra màn hình chuỗi đã được sắp xếp là 
		cout << "\nDay so duoc sap xep la: ";
		for (int k = 0; k < n; k++) {
			cout << a[k] << " ";
		}
	cout << "\n-------------------------------------";
	cout << "\nCo tiep tuc chuong trinh khong (c/k)?";
	tl = getch();
	if (tl == 'c') {
		goto L1;
	}
}