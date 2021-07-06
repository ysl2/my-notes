# C language

## 用shabang编译c文件

> 原链接：https://zhuanlan.zhihu.com/p/143231248

```c
#if 0
proName="${0%.*}"  #去掉文件名后缀，作为程序名
gcc -o $proName "$0"
./$proName "$@"   #传入命令行参数
rm $proName
exit
#endif
//main.c 公众号编程珠玑
#include<stdio.h>
int main(void) {
    printf("hello,编程珠玑\n");
    return 0;
}
```
