#include <stdio.h>
int main(void) {
  setvbuf(stdout, 0, 2, 0);
  setvbuf(stdin, 0, 2, 0);
  char str[100];
  printf("hello");
  while (1) {
    scanf("%s", str);
    printf("%s", str);
  }
  return 0;
}

