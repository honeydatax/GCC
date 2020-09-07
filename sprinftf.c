#include <stdarg.h>
#include <stdio.h>

int strslen(char *s){
	int pos=0;
	while(s[pos]!=0){
		pos++;
	}
	return pos;
}

int strcats(char *s1,char *s2){
	int pos=0;
	char *s3;
	s3=s1+strslen(s1);
	while(s2[pos]!=0){
		s3[pos]=s2[pos];
		pos++;
	}
	s3[pos]=s2[pos];
	return pos;
}


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

void strsfloat(char *s,float n){
	float nn=n;
	float nnn=n;
	char pp=0;
	int pos=0;
	int pos2=1;
	float signals=n;
	float divsb=100.00f;
	float divsa=0;
	s[pos]='+';
	if(signals<0){
		s[pos]='-';
		nn=0-nn;
	}
	for(pos=0;pos<5;pos++){
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

void strs4(char *s,long n){
	long nn=n;
	long pos=32;
	long divsa=0;
	long signals=4;
	long signals2=3;
	char *digits="0123456789ABCDEF0123456789ABCDEF";
	s[pos]=0;
	for(pos=pos-1;pos>-1;pos--){
		divsa=nn & signals2;
		if(divsa<0)divsa=0-divsa;
		s[pos]=(char) digits[(int)divsa];
		nn=nn/signals;
	}
}


void strsoct(char *s,long n){
	long nn=n;
	long pos=11;
	long divsa=0;
	long signals=8;
	long signals2=7;
	char *digits="0123456789ABCDEF0123456789ABCDEF";
	s[pos]=0;
	for(pos=pos-1;pos>-1;pos--){
		divsa=nn & signals2;
		if(divsa<0)divsa=0-divsa;
		s[pos]=(char) digits[(int)divsa];
		nn=nn/signals;
	}
}

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

int ssprintf(char *stringss,char *format,int num, ... ){
	va_list arguments;
	char sssss[32];
	int ar0;
	long ar1;
	float ar2;
	double ar3;
	char *sss;
	char *ssss;
	int nums=0;
	int count=0;
	int pos=0;
	int pos2=0;
	int shift=0;
	int shift2=0;
	stringss[0]=0;
	ar0=0;
	ar1=0;
	ar2=0.00f;
	ar3=0.00f;

	va_start(arguments,num);
	while(format[pos]!=0){
		if(shift==0){
			if(format[pos]!='%'){
				stringss[pos2]=format[pos];
				pos2++;
				stringss[pos2]=0;
				shift=0;
			}else{
				shift=1;
			}
		}else{
			if(format[pos]=='s'){
				sss=va_arg(arguments,char *);
				strcats(stringss,sss);
				pos2=strslen(stringss);
			} 
			if(format[pos]=='d'){
				ar0=va_arg(arguments,int);
				strsint(sssss,ar0);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
			} 
			if(format[pos]=='l'){
				ar1=va_arg(arguments,long);
				strslong(sssss,ar1);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
			} 
			if(format[pos]=='f'){
				ar2=(float) va_arg(arguments,double);
				strsfloat(sssss,ar2);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
			} 
			if(format[pos]=='F'){
				ar3=va_arg(arguments,double);
				strsdouble(sssss,ar3);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
			} 
			if(format[pos]=='x' || format[pos]=='X'){
				ar3=va_arg(arguments,long);
				strshex(sssss,ar3);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
			} 
			if(format[pos]=='o' || format[pos]=='O'){
				ar3=va_arg(arguments,long);
				strsoct(sssss,ar3);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
			} 

		if(format[pos]=='4'){
				ar3=va_arg(arguments,long);
				strs4(sssss,ar3);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
		} 

		if(format[pos]=='b'){
				ar3=va_arg(arguments,long);
				strsbin(sssss,ar3);
				strcats(stringss,sssss);
				pos2=strslen(stringss);
		} 




			shift=0;

		}
		pos++;
	}
	va_end(arguments);
	return pos;
}





int main(){
	char *s="hello world\n";
	int i=12345;
	long l=123456789;
	float f=12.34f;
	double F=12.3456f;
	char s1[10000];
	ssprintf(s1,"%s\n%i\n%l\n%f\n%F\n%x\n",5,i,l,f,F,0x12345678);
	printf("%s \n",s1);
	return 0;
}