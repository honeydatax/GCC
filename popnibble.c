#include <stdio.h>
 
int popnible(int a){
	return a & 15;
}
int main(){
	int i=0;
	for(i=1024;i<1032;i++){
		printf("%d<<%d\n",i,popnible(i));
	}
	return 0;
}