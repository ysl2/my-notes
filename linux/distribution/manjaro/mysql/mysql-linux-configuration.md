# mysql

> 此部分应优先按照[这里](https://github.com/ysl2/javaweb/blob/master/day29_Linux/%E8%B5%84%E6%96%99/%E5%AE%9E%E6%88%98%E6%96%87%E6%A1%A3/%E5%AE%9E%E6%88%98%E4%BA%8C%EF%BC%9ALinux%E4%B8%8B%E5%AE%89%E8%A3%85mysql_docx.pdf)进行配置。这个没有提到的相关内容，才继续参考下面的部分配置。

## 安装

### 安装的正确步骤

> 参考：https://medium.com/@rshrc/mysql-on-manjaro-973e4bfc4f05

```bash
# Step 1
sudo powerpill -S mariadb

# Step 2
# 先尝试启用一下，这里很大几率可能会失败
sudo systemctl start mysqld

# Step 3
# 如果上面失败的话，执行这条（否则不用执行）
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Step 4
# 注意此处有坑：需要仔细阅读控制台提示
# 在`Enter current password for root`的时候
# （更新）此处好像是用来设定密码的，因此不应该直接回车，而是应该设定密码
# 原先我写的是在此处直接回车，但是后来发现只有这一次要求输密码，并且以后的密码就取决于这里输入的内容
# 如果在此步骤出错，见下面的排错步骤重新安装
sudo systemctl start mysqld && sudo mysql_secure_installation

# Step 5
# （可选）安装界面程序，可以是图形界面，也可以是命令行。我选了cli
# 二选一
# cli
sudo powerpill -S mycli
# gui
# yay安装datagrip，或者通过vscode的mysql插件也可以访问数据库

# Step 6
# （可选）设置mysql服务开机启动
sudo systemctl enable mysqld
```

### 安装排错

1. 在 Step 3 发生错误：Permission denied，并且在家目录下发现多出了一个文件夹`data`

    ```bash
    # 控制台输出如下
    Installing MariaDB/MySQL system tables in './data' ...
    2021-02-06 15:29:07 0 [ERROR] mysqld: Can't create/write to file '/home/yusoli/data/aria_log_control' (Errcode: 13 "Permission denied")

    # 解决方案：
    # 1
    查看自己命令是否输入有误，比如把`data`写成了`date`
    # 2
    vim /etc/my.cnf.d/server.cnf
    在 `[mysqld]` 字段下面添加一条：
    datadir=/var/lib/mysql
    ```

1. 在 Step 4 发生错误：\[ERROR\](2002)

    - 解决方案 1：https://blog.csdn.net/Homewm/article/details/81628116

        ```bash
        vim /etc/mysql/my.cnf

        # 在`[mysqld]`标签下添加：
        protocol=tcp

        # 如果还是未能解决，继续找到所有此文件中引用的相关的位置，然后添加上述字段
        # 比如：
        # `/etc/mysql/mysql.conf.d/mysqld.cnf`
        # `/etc/mysql/conf.d/mysql.cnf`

        # 如果还是没解决，尝试添加到`[mysql]`标签下
        ```

    - 解决方案 2：回到第一步重新安装

        ```bash

        # 先停止数据库服务
        sudo systemctl stop mysqld
        sudo systemctl disable mysqld  # 如果设置了开机自启的话
        # 删除安装包及配置文件
        sudo powerpill -Rns mariadb
        # 切换到root用户，删除生成的数据库文件（必须切换用户，不能用sudo。因为要删除的文件夹对普通用户是隐藏的
        su root
        rm -r /var/lib/mysql

        # 然后参照安装步骤进行安装
        # 参考：Linux下彻底卸载mysql详解 - nicknailo - 博客园
        ```

## 登录

```bash
# 以root用户登录（这个用户指的是mysql的管理员）
sudo mysql -uroot -p
# 此时会提示输入密码。只有两种情况，要么是空，要么是自己之前设置的密码
```

## 关键文件位置

数据文件在`/var/lib/mysql`（需要切换到 root 用户才能进入）

配置文件在`/etc/my.cnf`（文件）和`/etc/my.cnf.d/`（目录）中

参考[archwiki](https://wiki.archlinux.org/index.php/MariaDB#Installation)

## 更改密码

参考[这里](mysql/mysql-change-password.md)

## gui 模式

### datagrip

```bash
yay -S datagrip
yay -S datagrip-jre
```

在选择数据库时，选择类型为`MariaDB`

datagrip 的插件与 idea 通用，因此`~/.ideavimrc`可以共用一份

datagrip 运行 sql 代码的快捷键：`ctrl + enter`，在运行的时候会提示运行单行还是多行。在可视模式下选中后可以只执行被选中的代码

### gui 模式排错

1. Access denied root@localhost

    原因：root 帐户默认不开放远程访问权限，所以需要修改一下相关权限

    -   解决方法 1：直接通过 root 再分配一个普通账户，然后分配所有权限。

        查阅[这里](https://github.com/ysl2/javaweb/blob/master/day04_MySQL%E5%A4%9A%E8%A1%A8%26%E4%BA%8B%E5%8A%A1/%E7%AC%94%E8%AE%B0/MySQL%E5%A4%9A%E8%A1%A8%26%E4%BA%8B%E5%8A%A1%E8%AF%BE%E5%A0%82%E7%AC%94%E8%AE%B0.md#dcl)

        或者参考[mysql-access-denied](mysql/mysql-access-denied.md)

        或者参考下图：

        ![1](assets/05-package-configuration/2021-02-26-11-00-08.png)

    -   解决方法 2（不建议）：在`/etc/my.cnf`文件的最后加上`skip-grant-tables`，这样可能会导致通过 vscode 链接数据库时访问被拒绝

        ```bash
        /etc/my.cnf

        skip-grant-tables
        ```

2. mysql 有可能导致 vscode 提示“可能需要升级 mysql 客户端”，因此最好用 mariadb，在 docker 上直接创建容器开启守护模式启动之后 vscode 就能连上
