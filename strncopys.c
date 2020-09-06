#include <stdio.h>
 
int strncopy(char *s1,char *s2,int size){
	int pos=0;
	while(pos<=size){
		s1[pos]=s2[pos];
		pos++;
	}
	return pos;
}

int main(){
	char s1[50];
	char *hello="hello world\n";
	strncopy(s1,hello,20);
	printf("%s  \n",s1);
	return 0;
}