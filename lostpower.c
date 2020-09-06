#include <stdio.h>
 
int lostpower(int a){
	return a >> 4;
}
int main(){
	int i=0;
	for(i=0;i<10;i++){
		printf("%d>>%d\n",i*50,lostpower(i*50));
	}
	return 0;
}