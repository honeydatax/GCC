#include <stdio.h>
#include <string.h>

void afill(char *s1,char c, int pos){
	int i=0;
	int i1=strlen(s1);
	int i2=pos/2;
	for(i=0;i<i2;i++){
		s1[i]=c;
		s1[i1-i]=c;
	}
}






int main(){
	char s[80]="hello world\n";
	afill(s,'.',5);
	printf("%s \n",s);
	return 0;
}