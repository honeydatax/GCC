#include <stdio.h>
 
int paperline(int a){
	int aa=a;
	aa=aa<<4;
	aa=aa | a;
	return aa ;
}
int main(){
	int i=0;
	for(i=0;i<15;i++){
		printf("%d<<%d\n",i,paperline(i));
	}
	return 0;
}