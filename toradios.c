#include <stdio.h>

  static double toRadians(double degrees)
  {
    return (degrees * 3.1415927) / 180.00f;
  }
int main(){
	printf("%f\n",toRadians(90.00f));
return 0;
}