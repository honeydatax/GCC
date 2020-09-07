#include <stdio.h>
#include <string.h>

void adigit(char *s1,int n){
	int i=0;
	char c1=0;
	for(i=0;i<n;i++){
		c1='0'+i;
		if(i>9)c1='A'+i-10;
		s1[i]=c1;
	}
	s1[n]=0;
}






int main(){
	char s[80];
	adigit(s,16);
	printf("%s \n",s);
	return 0;
}