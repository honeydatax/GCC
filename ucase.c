#include <stdio.h>

int ucase(char *s){
	int pos=0;
	while(s[pos]!=0){
		if (s[pos]>='a' && s[pos]<='z')s[pos]=(s[pos]-'a')+'A';
		pos++;
	}
	return pos;
}


int main(){
	char s1[]="HeLlO wOrLd \n";
	ucase(s1);
	printf("%s  \n",s1);
	return 0;
}