#include <stdio.h>
 
int strslen(char *s){
	int pos=0;
	while(s[pos]!=0){
		pos++;
	}
	return pos;
}

int main(){
	char *hello="hello world\n";
	printf("%s  %d\n",hello,strslen(hello));
	return 0;
}