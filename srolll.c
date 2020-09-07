#include <string.h>
#include <stdio.h>

int scrolll(char *s1){
	int i=0;
	int size=strlen(s1);
	char *s2=s1+1;	
	char *s3=s1;	
	for(i=0;i<size;i++){
		s3[i]=s2[i];
	}
	s2[i]=0;
	return i;
}






int main(){
	char s[80]="hello world\n";
	scrolll(s);
	printf("%s \n",s);
	return 0;
}