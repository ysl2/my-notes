# linux-and-python

## 0. 需要用到的工具

### 0.1 梯子

glados

> glados是收费梯子。刚开始会免费送 24 小时（edu 邮箱注册送 365 天），并且只要每天签到就多送一天。因此 github 上有人做了定时自动签到的脚本。相当于可以一直免费用

- 配置方法：见[另一篇文章](./GLaDOS-auto-signin-coding-picture-bed.html)
- 使用方法：
  - windows、安卓、mac 按照 [glados 官网](https://glados.best/)配置
  - linux 需要 clash 和 chashup（clashup **<u>仅在</u>** manjaro 发行版可直接通过自带的包管理器安装，其他发行版需要自己编译。参考[我的笔记](https://github.com/ysl2/my-notes/blob/master/linux/distribution/manjaro/03-china-source-and-download-settings.md#%E8%AE%BE%E7%BD%AEclash)）
  - ios 需要 shadowrocket

### 0.2 git & github

1. 学习

   - b 站教程（大多都讲的比较浅）
   - [《pro git book 2》](https://git-scm.com/book/zh/v2)（不是官方文档，但是 git 官方推荐这本书）
   - [我的 git 学习笔记](https://zhuanlan.zhihu.com/p/131615378)（一些排错）

2. [图形化工具](https://git-scm.com/downloads/guis)：可以不敲命令完成 git 操作。

   [lazygit 项目主页](https://github.com/jesseduffield/lazygit.git) <-> [b 站视频介绍](https://www.bilibili.com/video/BV1gV411k7fC)

3. [镜像站](https://github.com/ysl2/my-notes/blob/master/linux/distribution/manjaro/04-github-download-mirror.md)：解决国内克隆速度慢的问题

## 1. linux

### 1.1 学习

1. 环境

   > 在以下三种方式选择一种。mac 内核是 unix，和 linux 区别不大。

   - 虚拟机安装 linux（[virtualbox](https://github.com/ysl2/my-notes/blob/master/virtual-machine/virtual-linux/02-01-VirtualBox-and-Linux.md) 或 [vmware](https://github.com/ysl2/my-notes/blob/master/virtual-machine/virtual-linux/02-02-VMWare-and-Linux.md)）
   - windows 下，使用 linux 子系统 2（WSL2）
   - linux 真机（下文 1.2）

2. 书

   入门：

   - 《快乐的 Linux 命令行》（[社区翻译版在这](https://github.com/billie66/TLCL)）
   - [《Bash Reference Manual》](https://www.gnu.org/software/bash/manual)（bash 官方手册。这本作为工具书备查）

   进阶：

   - [《鸟哥的Linux私房菜》](http://linux.vbird.org/)

### 1.2 应用

1. 发行版选择

   |  发行版   | 特点                                                                                       | 包管理器        |
   | :-------: | :----------------------------------------------------------------------------------------- | :-------------- |
   | `centos`  | 适合服务器，更新策略稳定。但官方团队即将放弃更新。一部分包需要自己编译。                   | `rpm`和`yum`    |
   | `ubuntu`  | 适合服务器或日常使用。更新策略稳定。一部分包需要自己编译。                                 | `apt`           |
   | `manjaro` | 适合日常使用。更新策略激进。大部分包都可以在 community 和 AUR 中找到。小部分需要自己编译。 | `pacman`和`yay` |

2. 我的 manjaro 配置

   - [安装配置-界面配置-包配置](https://github.com/ysl2/my-notes/tree/master/linux/distribution/manjaro)（不同发行版之间的配置方法有差异）
   - dotfiles 及自动化脚本（基于 GNU stow。我写了[一个配合 stow 批量恢复 dotfiles 的 java 脚本](https://github.com/ysl2/stow-helper)。这个说起来比较麻烦，等后续需要的时候我再录一段视频演示）

## 2. python

1. 入门

   [《廖雪峰的 python 博客》](https://www.liaoxuefeng.com/wiki/1016959663602400)

   [《python 官方文档》](https://docs.python.org/zh-cn/3/)（作为工具书备查）

2. 进阶

   《python cookbook》（[社区翻译版](https://python3-cookbook.readthedocs.io/zh_CN/latest/)）

   《流畅的 python》

## 3. 其他

1. [b站【MIT 公开课】6.NULL 你计算机科学教育中遗失的一学期（完结·中英字幕·机翻）](https://www.bilibili.com/video/BV14E411J7n2)
   - [官网](https://missing.csail.mit.edu/)
   - [社区翻译的中文网站](https://missing-semester-cn.github.io/)
   - [笔记](https://github.com/ysl2/my-notes/tree/master/linux/tutor/mit-missing-course-in-university)
1. b 站 up 主[TheCW](https://space.bilibili.com/13081489?from=search&seid=4798216554892674728)，youtuber[Luke Smith](https://www.youtube.com/c/LukeSmithxyz)
1. [我的笔记主页](https://github.com/ysl2/my-notes)
1. [docker](https://github.com/jenkinsci/docker) <-> [图形化工具 lazydocker 项目主页](https://github.com/jesseduffield/lazydocker)
