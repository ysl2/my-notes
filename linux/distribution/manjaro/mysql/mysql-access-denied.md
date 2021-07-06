# Access denied for user 'root@localhost' (using password:NO)问题的解决

> 原链接：https://www.cnblogs.com/techgy/p/11726383.html

## 错误详情

使用 pymysql 连接数据库 mysql，一直无法连接上，

```bash
conn = pymysql.connect(host='localhost', port=3306, user='root', passwd='1234', db='test', charset='utf8')
```

原因是自己的 mysql 没有密码，即 root 进入直接 enter 就可以进入数据库，但这样的数据库在使用其他连接可能都会出现这种问题，所以解决问题的第一步就是给 root 设置一个密码。

## 解决步骤

```text
[root ~]# mysql -u root
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password:NO)
```

1. 停止 mysql 服务

    ```text
    [root ~]# net stop mysql
    ```

2. 在没有任何特权的情况下启动 mysql：

    首先找到 mysql 安装路径，找到`/etc/my.cnf`文件，在该文件末尾加上`skip-grant-tables`

    然后启动 mysql 服务

    ```text
    [root ~]# net start mysql
    ```

3. 输入 mysql 命令符

    ```text
    [root ~]# mysql -u root
    mysql>
    ```

4. 修复 root 用户的权限设置

    ```text
    mysql> use mysql;
    Database changed
    mysql> select * from  user;
    Empty set (0.00 sec)
    mysql> truncate table user;
    Query OK, 0 rows affected (0.00 sec)
    mysql> flush privileges;
    Query OK, 0 rows affected (0.01 sec)
    mysql> grant all privileges on *.* to root@localhost identified by 'YourNewPassword' with grant option;
    Query OK, 0 rows affected (0.01 sec)
    ```

    确认结果：

    ```text
    mysql> select host, user from user;
    +-----------+------+
    | host      | user |
    +-----------+------+
    | localhost | root |
    +-----------+------+
    1 row in set (0.00 sec)
    ```

    通过下面的命令详细查看`root@localhost`的权限

    ```text
    mysql> SHOW GRANTS FOR 'root'@'localhost';
    +----------------------------------------------------------------------------------------------------------------------------------------+
    | Grants for root@localhost                                                                                                              |
    +----------------------------------------------------------------------------------------------------------------------------------------+
    | GRANT ALL PRIVILEGES ON *.* TO `root`@`localhost` IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9' WITH GRANT OPTION |
    | GRANT PROXY ON ''@'%' TO 'root'@'localhost' WITH GRANT OPTION                                                                          |
    +----------------------------------------------------------------------------------------------------------------------------------------+
    2 rows in set
    Time: 0.049s
    ```

5. 退出外壳程序，把上面加上的`skip-grant-tables`取消，并以正常模式重启 mysql

    ```text
    mysql> quit;
    [root ~]# kill -KILL [PID of mysqld_safe]
    [root ~]# kill -KILL [PID of mysqld]
    [root ~]# service mysql start
    ```

6. 现在，可以使用设置的密码以 root 用户身份成功登录

    ```text
    [root ~]# mysql -u root -pYourNewPassword
    mysql>
    ```
