#include <stdio.h>
 
int neg(int a,int n){
	return n-a ;
}
int main(){
	int i=0;
	for(i=0;i<15;i++){
		printf("%d<<%d\n",i,neg(i,12));
	}
	return 0;
}