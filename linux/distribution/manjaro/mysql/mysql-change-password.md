# mysql 更改密码

> 原链接：https://cloud.tencent.com/developer/article/1512334

MariaDB设置初始化密码及修改密码

## 方法一

```text
[root@localhost ~]# mysql -uroot
MariaDB [(none)]> use mysql;
MariaDB [mysql]> UPDATE mysql.user SET password = PASSWORD('newpassward') WHERE user = 'root';
MariaDB [mysql]> FLUSH PRIVILEGES;
```

## 方法二

```text
[root@localhost ~]# mysql -uroot
MariaDB [(none)]> use mysql;
MariaDB [mysql]> SET password=PASSWORD('newpassward');
MariaDB [mysql]> FLUSH PRIVILEGES;
```

## 方法三

```text
[root@localhost ~]# mysqladmin -u root password 'newpassword'
#如果root已经设置过密码，采用如下方法
[root@localhost ~]# mysqladmin -u root -p 'oldpassword' password 'newpassword'
```
