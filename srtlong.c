#include <stdio.h>

void strslong(char *s,long n){
	long nn=n;
	long pos=0;
	long signals=0x7fffffff;
	long divsb=1000000000;
	long divsa=0;
	nn=signals & nn;
	signals++;
	signals=signals & n;
	s[pos]='+';
	if(signals!=0)s[pos]='-';
	for(pos=0;pos<10;pos++){
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
	strslong(s1,123456789);
	printf("%s  \n",s1);
	return 0;
}