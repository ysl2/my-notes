# Linux 上车方法

## Linux Online

https://www.webminal.org/terminal/proxy/index/

## 单系统/双系统

-   不动当前笔记本系统和硬盘分区的情况下，花 400 左右，买个 256 的 m2 固态，加一个硬盘盒，装原生 Linux。注意 sata 和 nvme 接口的区别盒子和条子接口要匹配。

-   AMD 机型优先推荐 deepin，美观加上大量的 wine 软件，可以解决 qq 和微信（存疑，需要进一步了解）deepin 偶尔出现 bug

-   Nvidia 推荐 Ubuntu，驱动完善

## 虚拟机

-   vmware

-   WSL2

## 云主机（购买服务器）

-   在阿里云或者华为云上，购买个服务器，学生机每月 9.9，不贵而且你可以学到很多东西，申请个域名，你还可以布置个你的个人网站，非常实用，现在我的服务器上，就是用 docker 搭建的个个人网盘，速度可以，而且非常实用，也比别的网盘安全

## 推荐的使用方法

-   在 windows 上用 IDE，连接上 Linux，使用 Linux 环境进行开发，或者是直接上 mac

    详细过程：Windows 作主力系统，并安装 VMware，其中运行一个 Server 版 Linux，去除图形化界面之后只需要少量资源即可非常流畅的运行，不会对日常使用造成任何影 响。之后把 VMware 设为开机自启动，挂在后台就可以不用管了。 然后安装 vscode，用 vscode 远程连接你的 Linux. 你就可以同时享受 Windows 强大的生态以及完整的 Linux 体验了。

-   树莓派（知乎李新），参考[豆瓣树莓派小组](https://m.douban.com/group/raspberry_pi/)

-   如果要装真正的系统，manjaro 适合日常使用
