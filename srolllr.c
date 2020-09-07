#include <string.h>
#include <stdio.h>

int scrollr(char *s1, char c){
	int i=0;
	int size=strlen(s1);
	char *s2=s1+1;	
	char *s3=s1;
	s3[size+1]=0;
	for(i=size;i>-1;i--){
		s2[i]=s3[i];
	}
	s3[0]=c;
	return size;
}






int main(){
	char s[80]="hello world\n";
	scrollr(s,'.');
	printf("%s \n",s);
	return 0;
}