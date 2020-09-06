#include <stdio.h>

int incmp(char *s,char *s2){
	int pos=0;
	int exit=0;
	int cmp=0;
	while(exit!=1){
		if(s[pos]!=s2[pos]){
			if(s[pos]>s2[pos])cmp=1;
			if(s[pos]<s2[pos])cmp=-1;
			if(s2[pos]==0)cmp=0;
			exit=1;
		}
		pos++;
	}
	return cmp;
}



int main(){
	int i=0;
	char *s1="hello world\0";
	char *s2="hello world\0";
	i=incmp(s1,s2);
	printf("%d  \n",i);
	return 0;
}