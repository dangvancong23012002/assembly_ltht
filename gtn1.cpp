#include <iostream.h>
#include <conio.h>

int n;
extern int GIAITHUA();
void main() {
	clrscr();
	cout << "\nHay vao n: "; cin >> n;
	cout << "\nGiai thua cua " << n << " la: " << GIAITHUA();
	getch();
}