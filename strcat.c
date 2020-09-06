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

int main(){
	char s1[50];
	s1[0]=0;//null var
	strcats(s1,"hello ");
	strcats(s1,"world \n ");
	printf("%s  \n",s1);
	return 0;
}