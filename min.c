#include <stdio.h>

  static int min(int a, int b)
  {
    return (a < b) ? a : b;
  }

int main(){
	printf("%d\n",min(50,210));
	return 0;
}