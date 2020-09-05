#include <stdio.h>

  static int floor(float a)
  {
    return (int) a;
  }

int main(){
	printf("%d\n",floor(50.98f));
	return 0;
}