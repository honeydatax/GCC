#include <stdio.h>

  static double toDegrees(double rads)
  {
    return (rads * 180.00f) / 3.1415927f;
  }
int main(){
	printf("%f\n",toDegrees(1.55f));
return 0;
}