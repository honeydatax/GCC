#include <stdio.h>
#include <string.h>

void cfill(char *s1,char c, int pos){
	int i=0;
	int i1=strlen(s1)/2;
	int i2=pos/2;
	for(i=0;i<pos;i++){
		s1[i1-i2+i]=c;
	}
}






int main(){
	char s[80]="hello world\n";
	cfill(s,'.',3);
	printf("%s \n",s);
	return 0;
}