#include <stdio.h>
#include <string.h>

void lpos(char *s1,char c, int pos){
	s1[strlen(s1)-pos]=c;
}






int main(){
	char s[80]="hello world\n";
	lpos(s,'.',3);
	printf("%s \n",s);
	return 0;
}