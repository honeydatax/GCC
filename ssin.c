#include <stdio.h>

  static double ssin(double x, double y)
  {
  int xx1=x;
  int yy1=y;
  if(xx1<0)xx1=0-xx1;
  if(yy1<0)yy1=0-yy1;
  static double
    S1 = -0.16666666666666632, // Long bits 0xbfc5555555555549L.
    S2 = 8.33333333332249e-3, // Long bits 0x3f8111111110f8a6L.
    S3 = -1.984126982985795e-4, // Long bits 0xbf2a01a019c161d5L.
    S4 = 2.7557313707070068e-6, // Long bits 0x3ec71de357b1fe7dL.
    S5 = -2.5050760253406863e-8, // Long bits 0xbe5ae5e68a2b9cebL.
    TWO_27 = 0x8000000,
    S6 = 1.58969099521155e-10; // Long bits 0x3de5d93a5acfd57cL.


    if (xx1 + yy1 > 0.7854f)
      return 0.0f;

    if (xx1 < 1 / TWO_27)
      return x;  

    double z = x * x;
    double v = z * x;
    double r = S2 + z * (S3 + z * (S4 + z * (S5 + z * S6)));
    if (y == 0)
      return x + v * (S1 + z * r);
    return x - ((z * (0.5 * y - v * r) - y) - v * S1);
  }
int main(){
	printf("%f\n",ssin(0.56,0));
	return 0;
}