#include <stdio.h>


int findchar(char *s,char c){
	int pos=0;
	while(s[pos]!=0 && s[pos]!=c){
		pos++;
	}
	if(s[pos]!=c)pos=-1;
	return pos;
}



int main(){
	int i=0;
	char *s1="HeLlO wOrLd \n";
	i=findchar(s1,'w');
	printf("%d  \n",i);
	return 0;
}