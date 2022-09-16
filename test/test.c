#include <stdio.h>
int main(void) {
  char str[100];
  printf("hello");
  while (1) {
    scanf("%s", str);
    printf("%s", str);
  }
  return 0;
}
