#include <stdio.h>

int t3(int a){
	return a*a*a;
}


int main(){
	int i=0;
	for(i=0;i<10;i++){
		printf("%d\n",t3(i));
	}
	return 0;
}