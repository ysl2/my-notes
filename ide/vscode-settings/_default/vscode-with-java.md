# vscode 搭建 java 环境

> 参考官方文档：https://code.visualstudio.com/docs/java/java-tutorial

直接安装插件`Java Extension Pack`，然后通过命令面板创建一个 java 项目（`Create Java Project`）

快速生成代码：右键 -> `Source Action`，然后选择想要自动生成的代码即可

快速导包：通过`<leader> + f`

## tomcat 相关

### tomcat 获取

不能直接用 pacman 下载的，会因为权限问题导致插件无法识别 server，必须手动下载一个

下载镜像：https://mirrors.cnnic.cn/apache/tomcat/

```text
cd ~
aria2c -x16 https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.63/bin/apache-tomcat-8.5.63.tar.gz
tar xvf ~/apache-tomcat-8.5.63.tar.gz
mv apache-tomcat-8.5.63 ~/.local/share/
rm ~/apache-tomcat-8.5.63.tar.gz
```

然后插件选择`~/.local/share/apache-tomcat-8.5.63`就能识别了

注意端口的占用情况：`code-server`也是 8080 端口

在关闭冲突端口的程序后，需要先关闭 tomcat，然后重新启动 tomcat

### tomcat管理页配置

1.  在 tomcat 目录下的`conf/tomcat-users.xml`中添加管理员：

    ```html
    <role rolename="admin‐gui" />
    <role rolename="admin-script" />
    <role rolename="manager-gui"/>
    <role rolename="manager-script"/>
    <role rolename="manager-jmx"/>
    <role rolename="manager-status"/>
    <user password="123456" username="yusoli" roles="admin-gui,admin-script,manager-gui,manager-script,manager-jmx,manager-status" />
    ```

1. 解除ip访问限制，防止远程tomcat的时候出现403错误

    > 参考：https://blog.csdn.net/w770583069/article/details/76084863

    `tomcat的安装目录/webapps/manager/META-INF/context.xml`

    将里面的内容注释掉或者修改为

    ```html
    <Valve className="org.apache.catalina.valves.RemoteAddrValve"
    allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1|\d+\.\d+\.\d+\.\d+" />
    ```

### tomcat 的 vscode 插件

如果直接`start server`，会什么都打不开

必须先通过插件命令在当前项目目录下创建一个`war`包，然后在`tomcat server`视窗里`Debug`这个`war`包，才能正常访问

这意味着每次执行 tomcat 之前，都需要先创建一个`war`，并且只要项目有改动，就要重新创建`war`，然后重新`Debug`

不用非得`Debug`，也有`Run`可以用。用法一样

参考：

-   [2019-12-13 vscode 中使用 tomcat for java 调试 web 项目](https://www.jianshu.com/p/be8ed90ddf47)
-   [VSCode 调试 Tomcat 应用(不用 Tomcat 插件)](https://blog.csdn.net/herotangabc/article/details/106539052)

## maven 相关

### 国内源

国内源已经在`~/.m2/settings.xml`中配置好了。

1. :warning:必须在 vscode 设置使用自定义`settings.xml`的设置项：

    ```text
    "maven.executable.options": "-s /home/yusoli/.m2/settings.xml",
    ```

1. （可选）在每个项目下的`pom.xml`的`<project></project>`标签内加入下面字段。目的是为了重写官方`super.pom.xml`的配置，优先使用国内源

    ```html
    <!-- yusoli -->
    <repositories>
        <repository>
            <id>central</id>
            <url>http://host:port/content/groups/public</url>
        </repository>
    </repositories>

    <pluginRepositories>
        <pluginRepository>
            <id>central</id>
            <url>http://host:port/content/groups/public</url>
        </pluginRepository>
    </pluginRepositories>
    ```

### 用 maven 自动创建一个 javaweb 项目模板

参考：

-   [vscode 搭建 javaweb 项目(jdk、maven 环境变量配置、Tomcat 下载安装)-小白入门篇](https://blog.csdn.net/weixin_42951763/article/details/106150142)
-   [使用 vscode 搭建 javaweb 项目](https://blog.csdn.net/weixin_44573776/article/details/107899379)
-   [apache-maven-3.6.0 的安装配置](https://blog.csdn.net/weixin_43916850/article/details/87959273)

## 通过maven部署tomcat -- maven tomcat7插件

> 参考：https://www.cnblogs.com/letcafe/p/Tomcat2Maven.html
>
> 插件官方文档：http://tomcat.apache.org/maven-plugin-2.1/index.html

### 插件说明

Maven本身不提供任何插件将war包发布到远程站点，例如Tomcat这样类似的Servlet容器，但是，Apache Tomcat本身提供了一个Maven插件：

```html
<dependency>
    <groupId>org.apache.tomcat.maven</groupId>
    <artifactId>tomcat7-maven-plugin</artifactId>
    <version>2.1</version>
</dependency>
```

tomcat7-maven-plugin是很久以前的插件版本，默认支持到Tomcat7，但是对于目前最新的Tomcat9同样可以使用该插件

#### 插件支持的目标

Tomcat7插件目标调用格式如下：

```text
mvn tomcat7:[goal]
```

|[goal] | 描述 |
|:---:|:---|
|`deploy` | 部署war包到Tomcat中 |
|`deploy-only` | 不经过package阶段，直接将包部署到Tomcat中（传输现成的） |
|`exec-war` | 创建一个包含必要Apache Tomcat类库的自可执行jar包，这允许使用类似'jar -jar mywebapp.jar'直接运行APP而不需要Tomcat实例 |
|`exec-war-only` | 同上exec-war，但是不使用package阶段 |
|`help` | 展示所有的帮助信息 |
|`redeploy` | 重新部署war包到Tomcat(等同于deploy目标加上update=true参数) |
|`redeploy-only` | 重新部署war包到Tomcat但是不经过package阶段(等同于deploy目标加上update=true参数) |
|`run` | 将当前项目作为动态web程序(exploded)，使用嵌入的Tomcat服务器运行 |
|`run-war`| 将当前项目作为打包后的war(war)，使用嵌入的Tomcat服务器运行 |
|`run-war-only` | 同run-war，但是不使用package阶段 |
|`shutdown` | 关闭所有已经开始的嵌入式Tomcat服务器 |
|`standalone-war` | 创建嵌入Tomcat的可执行war，并且可以在别的地方部署 |
|`standalone-war-only` | 同standalone-war但是不使用package阶段 |
|`undeploy` | 从Tomcat服务器中，取消部署某一个项目 |

#### 插件参数说明

具体可参考[官方文档](http://tomcat.apache.org/maven-plugin-2.1/tomcat7-maven-plugin/plugin-info.html)：

1. 必选参数

    > 以下参数必选，但是可以在pom中空缺，空缺时将采用默认值

    | 名称 | 描述 | 默认值 |
    |:---:|:---|:---|
    | `charset` | 在与Tomcat Manager通信是的URL编码字符集 | `ISO-8859-1` |
    | `mode` | 部署的模式，值可为：`war`,`context`,`both` | `war` |
    | `path` | 应用程序运行的上下文路径，必须以`/`开始	| `/${project.artifactId}` |
    | `update` | 当部署已存在的应用时，是否自动`undeploy`该应用 | `false` |
    | `url` | Tomcat Manager实例使用的全路径 | `http://localhost:8080/manager/text` |
    | `warFile` | 部署warFile的路径	| `${project.build.directory} /${project.build.finalName}.war` |

2. 可选参数

    | 名称 | 描述 |
    |:---:|:---|
    | `contextFile`| Tomcat的`context.xml`路径，对于`mode=war`不适用，默认为`${project.build.directory}/${project.build.finalName}/META-INF/context.xml` |
    | `ignorePackaging` | 如果设置为`true`，忽略类型不是war的项目 |
    | `username` | 部署到Tomcat的username |
    |`password` |	部署到Tomcat的password |
    |`server` |	指定Maven的setting.xml中配置的`server id`用于Tomcat认证 |
    | `tag` | 应用程序在Tomcat中使用的标签的名字 |

### 通过 maven 运行 tomcat8

> 参考：https://blog.csdn.net/canot/article/details/50968619?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&dist_request_id=52e951b7-b3de-4038-820f-208f30ac8836&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.control

注意：这个方法实际上是通过 maven 的 tomcat7 插件去调用 tomcat8

1.  需要先进行上面的[tomcat管理页配置](#tomcat管理页配置)

1. `~/.m2/settings.xml`中需要指定server的`id`、`username`、`password`，但是有dotfiles可以省略这一步。如果不指定也行，但是项目的`pom.xml`中需要指定。这样会把username和password暴露在项目中

    ```html
    <servers>
        <server>
            <id>tomcatServer</id>
            <username>username</username>
            <password>password</password>
        </server>
    </servers>
    ```

1.  在项目的`pom.xml`中添加以下字段：

    注意：把下面的 localhost 换成远程主机名，就可以通过远程主机的 tomcat 部署

    ```html
    <project>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <server>tomcat8</server>
                    <url>http://localhost:8080/manager/text</url>
                    <username>yusoli</username>
                    <password>123456</password>
                    <charset>UTF-8</charset>
                    <update>true</update>
                    <path>/${project.artifactId}</path>
                    <port>8080</port>
                </configuration>
            </plugin>
        </plugins>
    </project>
    ```

1.  执行 maven 自定义命令：

    -   运行（可用于调试，会在控制台输出信息）：`tomcat7:run`

    -   停止运行（不好用，直接用`ctrl + c`停止）：

        ```text
        tomcat是 tomcat:stop
        tomcat7应该是 tomcat7:shutdown
        ```

    -   部署：`tomcat7:deploy`
    -   重新部署：`tomcat7:redeploy`
    -   停止部署：`tomcat7:undeploy`

### 异常处理

1. java.net.BindException: Permission denied

    参考：https://blog.csdn.net/zws1987211/article/details/6787393

    原因：Linux 系统下只有 root 能访问 1024 以下的端口

    解决方法：

    1. 端口映射

        - iptables 命令：

            ```text
            iptables -t nat -A PREROUTING -p tcp --dport <低端口> -i eth0 -j REDIRECT --to-port <原先监听的高端口>
            ```

            登录到 root 用户，然后执行：

            ```text
            iptables -t nat -A PREROUTING -p udp --dport 162 -i eth0 -j REDIRECT --to-port 2000
            ```

        - rinetd 程序

            ```text
            ipchans -I input --proto TCP --dport <低端口> -j REDIRECT <高端口>
            ```

    2. 改程序的 sid

        修改程序的权限，例如 chmod 7755 ...

    3. 修改内核

        修改内核的 make_sock 相关部分
