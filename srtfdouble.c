#include <stdio.h>

void strsdouble(char *s,double n){
	double nn=n;
	double nnn=n;
	char pp=0;
	int pos=0;
	int pos2=1;
	double signals=n;
	double divsb=100.00f;
	double divsa=0;
	s[pos]='+';
	if(signals<0){
		s[pos]='-';
		nn=0-nn;
	}
	for(pos=0;pos<8;pos++){
		nnn=nn;
		divsa=nn/divsb;
		if(pos==3){
			pos2++;
			s[pos+1]='.';
		}
		pp=(char) divsa;
		nn=nnn-(divsb*pp);
		pp=pp+'0';
		s[pos+pos2]=(char) pp;
		divsb=divsb/10.00f;
	}
	s[pos+pos2]=0;
}


int main(){
	int i=0;
	char s1[50];
	strsdouble(s1,123.45f);
	printf("%s  \n",s1);
	return 0;
}