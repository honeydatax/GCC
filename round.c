#include <stdio.h>

  static int round(float a)
  {
    return (int) ((float)(a + 0.49f));
  }
int main(){
	printf("%d\n",round(78.60f));
return 0;
}