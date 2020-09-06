#include <stdio.h>

  static double ccoss(double x, double y)
  {
  int xx1=x;
  int yy1=y;
  if(xx1<0)xx1=0-xx1;
  if(yy1<0)yy1=0-yy1;
  static double
    C1 = 0.0416666666666666, // Long bits 0x3fa555555555554cL.
    C2 = -1.388888888887411e-3, // Long bits 0xbf56c16c16c15177L.
    C3 = 2.480158728947673e-5, // Long bits 0x3efa01a019cb1590L.
    C4 = -2.7557314351390663e-7, // Long bits 0xbe927e4f809c52adL.
    C5 = 2.087572321298175e-9, // Long bits 0x3e21ee9ebdb4b1c4L.
    TWO_27 = 0x8000000,
    C6 = -1.1359647557788195e-11; // Long bits 0xbda8fae9be8838d4L.

    double z = x * x;
    double r = z * (C1 + z * (C2 + z * (C3 + z * (C4 + z * (C5 + z * C6)))));

    if (x < 0.3)
      return 1 - (0.5 * z - (z * r - x * y));

    double qx = (x > 0.78125) ? 0.28125 : (x * 0.25);
    return 1 - qx - ((0.5 * z - qx) - (z * r - x * y));


  }
int main(){
	printf("%f\n",ccoss(0.56,0));
	return 0;
}