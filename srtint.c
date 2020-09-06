#include <stdio.h>

void strsint(char *s,int n){
	int nn=n;
	int pos=0;
	int signals=0x7fff;
	int divsb=10000;
	int divsa=0;
	nn=signals & nn;
	signals++;
	signals=signals & n;
	s[pos]='+';
	if(signals!=0)s[pos]='-';
	for(pos=0;pos<5;pos++){
		divsa=nn/divsb;
		divsa=divsa+'0';
		s[pos+1]=(char) divsa;
		nn=nn % divsb;
		divsb=divsb/10;
	}
	s[pos+1]=0;
}


int main(){
	int i=0;
	char s1[50];
	strsint(s1,12345);
	printf("%s  \n",s1);
	return 0;
}