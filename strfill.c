#include <stdio.h>

int strsfills(char *s,char c){
	int pos=0;
	while(s[pos]!=0){
		s[pos]=c;
		pos++;
	}
	return pos;
}


int main(){
	int i=0;
	char s1[50]="hello world";
	strsfills(s1,'*');
	s1[40]=0;
	printf("%s  \n",s1);
	return 0;
}