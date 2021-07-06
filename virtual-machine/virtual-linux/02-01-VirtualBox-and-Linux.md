# VirtualBox安装Linux

[VirtualBox（官网下载）](https://www.virtualbox.org/wiki/Downloads)

[centos（清华源）](https://mirrors.tuna.tsinghua.edu.cn/centos/8/isos/x86_64/?C=M&O=D)

[中科大源](http://mirrors.ustc.edu.cn/)

## 主机组合键

![picture 1](assets/02-01-VirtualBox-and-Linux/2021-01-02-13-54-13.png)

![picture 2](assets/02-01-VirtualBox-and-Linux/2021-01-02-14-01-30.png)

另外，把snapshot的快捷键取消，因为这个快捷键与打开终端的快捷键冲突

更新：把主机组合键改为`ctrl + shift + alt`

## 增强功能

![1](assets/02-01-VirtualBox-and-Linux/2021-01-31-18-32-52.png)

如果安装增强程序失败，就手动安装：

> 参考：https://superuser.com/a/1407054

```bash
sudo mkdir /media/cdrom
sudo mount /dev/cdrom /media/cdrom
```

然后执行：

```bash
sudo sh VBoxLinuxAdditions.run
```

可以把上述过程写成一个开机自启服务，或者直接修改fstab进行挂载。

需要注意的是，最后的`sh VBoxLinuxAdditions.run`不要写在服务里，只需要写挂载的那部分就行了

## 视图

### 缩放模式

![picture 3](assets/02-01-VirtualBox-and-Linux/2021-01-02-14-03-36.png)

### 全屏模式

![picture 4](assets-02-01-VirtualBox-and-Linux/image/2021-01-02-14-05-30.png)

### 自动调整显示尺寸（需要安装增强功能）

https://blog.csdn.net/u012631731/article/details/79548621

## 安装步骤

![1](assets/02-01-VirtualBox-and-Linux/IMG_1991.jpg)

![2](assets/02-01-VirtualBox-and-Linux/IMG_1989.jpg)

![3](assets/02-01-VirtualBox-and-Linux/IMG_1992.jpg)

![4](assets/02-01-VirtualBox-and-Linux/IMG_1993.jpg)

## 添加练习用测试硬盘（可选）

选中一个虚拟机 -> 设置 -> 存储

![1](assets/02-01-VirtualBox-and-Linux/IMG_1973.jpg)

![2](assets/02-01-VirtualBox-and-Linux/IMG_1974.jpg)

## 设置桥接网络

![picture 10](assets/02-01-VirtualBox-and-Linux/2021-01-04-16-54-47.png)

![picture 11](assets/02-01-VirtualBox-and-Linux/2021-01-04-16-54-56.png)
