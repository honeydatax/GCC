#include <stdio.h>

int strnfill(char *s1,char c,int size){
	int pos=0;
	while(pos<=size){
		s1[pos]=c;
		pos++;
	}
	return pos;
}

int main(){
	int i=16;
	char s1[50];
	strnfill(s1,'*',i);
	s1[i]=0;//chr null ending	
	printf("%s  \n",s1);
	return 0;
}