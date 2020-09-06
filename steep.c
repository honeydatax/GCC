#include <stdio.h>

   int steeps (int a)
  {
    return a*a;
  }
int main(){
	int i=0;
	for(i=0;i<25;i++){
		printf("%d\n",steeps(i));
	}
	return 0;
}