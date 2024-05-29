#include <iostream.h>
#include <conio.h>
int a,n;
extern int LT();
void main(void)
{
	clrscr();
	cout << "\nHay vao a : "; cin >> a;
	cout << "\nHay vao n : "; cin >> n;
	cout << "\n" << a << " luy thua " << n << " la : " << LT();
	getch();
}
