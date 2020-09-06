#include <stdio.h>
 
int popnible(int a,int b){
	int aa=a;
	aa=aa<<4;
	aa=aa | b;
	return aa ;
}
int main(){
	int i=0;
	for(i=0;i<15;i++){
		printf("%d<<%d\n",i,popnible(i,i));
	}
	return 0;
}