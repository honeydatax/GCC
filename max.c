#include <stdio.h>

 static int max(int a, int b)
  {
    return (a > b) ? a : b;
  }


int main(){
	printf("%d\n",max(50,98));
	return 0;
}