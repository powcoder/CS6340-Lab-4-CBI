https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder

#include<stdio.h>

void f() {
  int x = 0, y, z;
  scanf("%d%d", &y, &x);
  if (y > 10)
    y = 0;
  else
    y = 1;
  if (x < 1) {
    z = y / x; // divide-by-zero
  }
}

int main() {
  f();
}

