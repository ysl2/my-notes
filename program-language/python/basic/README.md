# python-basic

## 列表

列表底层是动态扩容的数组

以下是两种创建二维列表的方式，二者等价

```python
# 创建
scores = []
for _ in range(0, 5):
    scores.append([0] * 3)
scores[0][0] = 95
print(scores)

scores = [[0] * 3 for _ in range(5)]
scores[0][0] = 95
print(scores)

# 遍历
for row in range(len(scores)):
    for column in range(len(scores[row])):
        print(scores[row][column], end=' ')
    print()
```

## python乱码问题

在文件第一行添加下面的内容

```python
# -*- coding: UTF-8 -*-
```

## pydoc查看方法

1. 在IDLE中输入`help()`进入帮助页面。按`quit`退出

2. 在IDLE中按`F1`，可以打开如下的窗口（在Linux命令行下无效）

3. 在命令行下，`pydoc some_module`

4. （推荐这种方案）在命令行下，`pydoc -p 8888`，然后按`b`打开浏览器查看所有安装的包文档

## 参数类型

```python
# 顺序：位置参数，默认参数，可变参数，命名关键字参数，关键字参数
def template1(a, b=0, *args, c,**kwargs):
    # 此处c前面的 * 省略，因为前面有可变参数。如果前面没有可变参数，则 c 前面需要加上 *
    # 对于命名关键字参数，在调用时必须给出参数名。否则会报错
    pass

def template2(a, b=0, *, c,**kwargs):
    # 此处c前面的 * 不能省略
    pass

def f2(a, b, c=0, *args, d, **kw):
    # 如果命名关键字参数d前面有可变参数args,那么d前面的 * 必须省略
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'd =', d, 'kw =', kw)
f2(1, 2, [3, 4, 5], d=99, kw1=None, kw2='99')
```

## 可迭代对象

> 本部分来源于IDLE

### 列表API

```text
>>> s = []
>>> s.
s.append(   s.copy(     s.extend(   s.insert(   s.remove(   s.sort(
s.clear(    s.count(    s.index(    s.pop(      s.reverse(
```

### 元组API

```text
>>> s = ()
>>> s.
s.count(  s.index(
```

### 字典API

```text
>>> s = dict()
>>> s.
s.clear(       s.get(         s.pop(         s.update(
s.copy(        s.items(       s.popitem(     s.values(
s.fromkeys(    s.keys(        s.setdefault(
```

### 集合API

```text
>>> s = set()
>>> s.
s.add(                          s.issubset(
s.clear(                        s.issuperset(
s.copy(                         s.pop(
s.difference(                   s.remove(
s.difference_update(            s.symmetric_difference(
s.discard(                      s.symmetric_difference_update(
s.intersection(                 s.union(
s.intersection_update(          s.update(
s.isdisjoint(
```

## 指针与值

1. 通过变量名，找其对应的地址

    ```python
    a = 5
    # 使用内置函数`id()`
    print(id(a))
    ```

2. 通过地址找值

    ```python
    # 接上例
    import ctypes
    value_of_a = ctypes.cast(id(a), ctypes.py_object).value
    print(value_of_a)
    ```

## 查看对象的所有属性

参考：https://www.cnblogs.com/klchang/p/7296058.html

