#include <stdio.h>

void strsbin(char *s,long n){
	long nn=n;
	long pos=32;
	long divsa=0;
	long signals=2;
	long signals2=1;
	char *digits="0123456789ABCDEF0123456789ABCDEF";
	s[pos]=0;
	for(pos=pos-1;pos>-1;pos--){
		divsa=nn & signals2;
		if(divsa<0)divsa=0-divsa;
		s[pos]=(char) digits[(int)divsa];
		nn=nn/signals;
	}
}


int main(){
	int i=0;
	char s1[150];
	strsbin(s1,0x12345678);
	printf("%s  \n",s1);
	return 0;
}