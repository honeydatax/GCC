#include <stdio.h>

int lcase(char *s){
	int pos=0;
	while(s[pos]!=0){
		if (s[pos]>='A' && s[pos]<='Z')s[pos]=(s[pos]-'A')+'a';
		pos++;
	}
	return pos;
}

int main(){
	char s1[]="HeLlO wOrLd \n";
	lcase(s1);
	printf("%s  \n",s1);
	return 0;
}