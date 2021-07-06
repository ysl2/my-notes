# 远程登录mysql数据库的两种方法

> 原链接： https://www.cnblogs.com/skyWings/p/5952795.html

## 连接远程数据库

### 显示密码

如：MySQL 连接远程数据库（192.168.5.116），端口“3306”，用户名为“root”，密码“123456”

```text
mysql>mysql -h 192.168.5.116 -P 3306 -u root -p123456
```

### 隐藏密码

如：MySQL 连接本地数据库，用户名为“root”，

```text
mysql>mysql -h localhost -u root -p
Enter password:
```

## 配置mysql允许远程链接

默认情况下，mysql帐号不允许从远程登陆，只能在localhost登录。本文提供了二种方法设置mysql可以通过远程主机进行连接。

### 改表法

在localhost登入mysql后，更改 "mysql" 数据库里的 "user" 表里的 "host" 项，将"localhost"改称"%"

例如：

```text
yusoli>mysql -u root -p
Enter password:
……
mysql>
mysql>update user set host = '%' where user = 'root';
mysql>select host, user from user;
```

### 授权法

例如： 你想myuser使用mypassword（密码）从任何主机连接到mysql服务器的话。

```text
mysql>GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%'IDENTIFIED BY 'mypassword' WITH GRANT OPTION;
```

如果你想允许用户myuser从ip为192.168.1.6的主机连接到mysql服务器，并使用mypassword作为密码

```text
mysql>GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'192.168.1.3'IDENTIFIED BY 'mypassword' WITH GRANT OPTION;
mysql>FLUSH PRIVILEGES
```

使修改生效，就可以了

## 常见问题

1. 在采用法二授权法之后，无法在本地登录mysql（如：

    ```text
    yusoli>mysql -u root -p -h 192.168.5.116

    Enter password:
    ERROR 1045 (28000): Access denied for user 'root'@'loadb116' (using password: YES)
    ```

    上例中loadb116是主机名.

    解决方法：

    1. 这时可以使用：mysql  -u root -p 登录，进入到mysql后。

        ```text
        mysql> grant all privileges on *.* to 'root'@'loadb116'
            identified by '123456' with grant option;
        Query OK, 0 rows affected (0.00 sec)
        mysql> flush privileges;
        Query OK, 0 rows affected (0.00 sec)
        ```

    2. 在本地使用ip地址登录

        ```text
        yusoli> mysql -u root -p -h 192.168.5.116
        Enter password:
        Welcome to the MySQL monitor.  Commands end with ; or /g.
        Your MySQL connection id is 60
        Server version: 5.1.45 MySQL Community Server (GPL)

        Type 'help;' or '/h' for help. Type '/c' to clear the buffer.
        ```
