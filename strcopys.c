#include <stdio.h>
 
int strcopy(char *s1,char *s2){
	int pos=0;
	while(s2[pos]!=0){
		s1[pos]=s2[pos];
		pos++;
	}
	s1[pos]=s2[pos];
	return pos;
}

int main(){
	char s1[50];
	char *hello="hello world\n";
	strcopy(s1,hello);
	printf("%s  \n",s1);
	return 0;
}