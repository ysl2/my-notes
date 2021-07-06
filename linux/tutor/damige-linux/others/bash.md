# bash

## 注释

[bash与vim的注释](https://blog.csdn.net/Li_suhuan/article/details/90173436)

## 窗口

服务器命令行下打开多个窗口；`ctrl + alt + F2`

注意：可选`F1` ~ `F12`，可以在12个窗口之间切换

关闭其他窗口：

```bash
# 先用ps -ef看一下用户进程，并筛选带bash的字段
ps -ef | grep bash

# 找到不是当前窗口的bash进程号。比如是1500
# 然后用kill命令
kill 1500

# 其他窗口道理一样
```
