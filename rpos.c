#include <stdio.h>

void rpos(char *s1,char c, int pos){
	s1[pos]=c;
}






int main(){
	char s[80]="hello world\n";
	rpos(s,3,'.');
	printf("%s \n",s);
	return 0;
}