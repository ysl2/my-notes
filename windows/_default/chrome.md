# Chrome设置

## surfing keys设置

生存级：

```text
d
u
h
j
k
l
E
R
f
x
X
gg
G
gi
yy
```

中级：

```text
F Go one tab history back
B Go one tab history forward
S Go back in history
D Go forward in history
on Open newtab
gf Open a link in non-active new tab
yT Duplicate current tab in background
<< Move current tab to left
>> Move current tab to right
r  Reload the page
;u 用vim编辑当前浏览器的URL，然后在新标签页打开
;U 用vim编辑当前浏览器的URL，然后在当前标签页打开
```

## JS书签代码(Bookmarklet)

### 分屏

> 原链接：https://www.zhihu.com/question/389192959/answer/1686113909
>

我昨天也是这样的需求，参考了一下知乎的另一个分屏浏览同一个网页的答案，自己折腾了一下，找到了解决办法。

以我的需求举例，我需要左侧显示vue的官方文档https://v3.cn.vuejs.org/guide/introduction.html

右侧显示我本地跑起来的项目，地址为localhost:8080那么首先，打开浏览器，新建个空白选项卡并点击地址栏的五角星添加书签，网址修改为：

```text
javascript:document.write('<html><head></head><frameset cols=\'50%25,*\'><frame src=' + "https://v3.cn.vuejs.org/guide/introduction.html" + '><frame src=' + location.href + '></frameset ></html>')
```

完成后，打开一个选项卡，地址栏输入 localhost:8080，然后再点击刚才新增的那个书签，就完成了，效果：![1](https://pic2.zhimg.com/50/v2-2d05b3429e33a5d4a4ec0ca7748756df_hd.jpg?source=1940ef5c)

同理，你可以把需要的网址进行替换。这样就完成同一个标签页分屏了。思路说起来其实也就是利用iframe内嵌了两个网页，你要是前端，自己现场手写都行。

### 百度网盘倍速

```text
# 1.25是倍速，可以调整（太大的话没有效果，3倍速之内可以）
javascript:videojs.getPlayers("video-player").html5player.tech_.setPlaybackRate(1.25)
```

### 参考链接

- https://www.bilibili.com/video/BV1bK4y1r7dj?t=77
- https://www.runningcheese.com/cheesebookmarks
- https://www.cnblogs.com/ayuuuuuu/p/13368750.html#%E4%BB%A3%E7%A0%81
