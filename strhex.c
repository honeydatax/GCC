#include <stdio.h>

void strshex(char *s,long n){
	long nn=n;
	long pos=8;
	long divsa=0;
	long signals=0x10;
	long signals2=0xf;
	char *digits="0123456789ABCDEF0123456789ABCDEF";
	s[pos]=0;
	for(pos=7;pos>-1;pos--){
		divsa=nn & signals2;
		s[pos]=(char) digits[(int)divsa];
		nn=nn/signals;
	}
}


int main(){
	int i=0;
	char s1[50];
	strshex(s1,0x12345678);
	printf("%s  \n",s1);
	return 0;
}