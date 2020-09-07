#include <stdio.h>
#include <string.h>

void rfill(char *s1,char c, int pos){
	int i=0;
	for(i=0;i<pos;i++){
		s1[i]=c;
	}
}






int main(){
	char s[80]="hello world\n";
	rfill(s,'.',3);
	printf("%s \n",s);
	return 0;
}