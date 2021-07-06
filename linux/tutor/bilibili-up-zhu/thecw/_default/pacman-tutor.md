# pacman 教程

arch user repository

man pacman

## 命令

三大类最实用：

### -S：搜索与安装

| 示例                   | 含义                                                                        |
| ---------------------- | --------------------------------------------------------------------------- |
| `sudo pacman -S vlc`   | 安装 vlc。如果没安装过会提示你是否下载，如果已经安装过会重新装一遍          |
| `sudo pacman -Sy`      | 获取最新的软件情报，看看我现在安装的是不是最新的（不会实际更新）            |
| `sudo pacman -Syy`     | 不管是不是最新的，强行获取一遍情报（不会实际更新）                          |
| `sudo pacman -Su`      | u 的意思是 update                                                           |
| `sudo pacman -Syu`     | 更新你的软件源，并更新你的软件                                              |
| `sudo pacman -Syyu`    | 强行刷新一遍，然后更新                                                      |
| `sudo pacman -Ss`      | s 的意思是 search，查询一个软件，会显示软件的名字，软件的来头，和软件的简介 |
| `sudo pacman -Ss ^vim` | 搜索所有以 vim 开头的软件（正则表达式）                                     |
| `sudo pacman -Sc`      | 删掉缓存的安装包                                                            |

### -R：删除

| 示例                   | 含义                                                |
| ---------------------- | --------------------------------------------------- |
| `sudo pacman -R vim`   | 仅删除 vim，不删除相关依赖                          |
| `sudo pacman -Rs vim`  | 删除这个软件和它的所有依赖软件                      |
| `sudo pacman -Rns vim` | 会删掉这个软件的 dependences 和全局配置文件，更干净 |

### -Q：查询

| 示例                             | 含义                                                                                                                               |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `sudo pacman -Q`                 | 显示所有软件列表                                                                                                                   |
| `sudo pacman -Q \| wc -l`        | 显示有多少个软件                                                                                                                   |
| `sudo pacman -Qe`                | 只显示用户安装的软件，不显示系统自动安装的软件                                                                                     |
| `sudo pacman -Qe \| wc -l`       | 显示我自己安装的软件有多少个                                                                                                       |
| `sudo pacman -Qeq`               | 不显示版本号，只会显示软件名称                                                                                                     |
| `sudo pacman -Qs vim`            | 查询所有本地的与 vim 有关的软件，注意是本地的                                                                                      |
| `sudo pacman -Qdt`               | 查询孤儿。孤儿（orphans）：有的时候，可能在你安装，删除，查询过程中，可能会有一些 dependences 不再被依赖，但是依然会存在你的电脑中 |
| `sudo pacman -Qdtq`              | 通过不显示版本号，只显示名称的方式，来显示孤儿                                                                                     |
| `sudo pacman -R $(pacman -Qdtq)` | 删除这些孤儿（这条运用了正则表达式，括号内其实可以当成是一个变量，然后用外层命令来删除它们）                                       |
| `sudo pacman -Ql alacritty`      | 查询alacritty包所包含的文件的具体下载位置                                                                                          |
## 配置文件

pacman 的配置文件在/etc/pacman.conf 路径，如果想进行配置，可以用 sudo vim /etc/pacman.conf 来编辑

进入编辑界面之后，首先是 Color，在 36 行，默认是被批注的（#），打开之后会显示 pacman 高亮，各种颜色

Checkspace，如果你系统都装满了，没有空间的时候，他会告诉你

ILoveCandy，如果显示的话，pacman 的进度条不会是一串井号（#########），而是一个吃豆人

其它的就是软件源。我们在国内用 linux 的话会被墙，但是中国对 arch 的支持是非常好的，只要网上搜索一下 arch 的源就好了。怎么编辑呢？

首先在 11 行左右：

```bash
[multilib]
SigLevel PackageRequired
Include /etc/pacman. d/mirrorlist
```

在这下面有一个`[archlinuxcn]`，配置一下源（具体这里没说），但是一定要配置
