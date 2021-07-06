# KDE 设置

<details>
    <summary>最终效果图</summary>

![1](assets/02-00-kde-settings/2021-03-15-12-58-04.png)

</details>

## 外接显示屏

系统设置里有，顺便设置一下全局缩放（图里最下面那块）

> 2021-05-10 注意：不要改成 125%，会导致 flameshot 出现 bug。应该改成 131.25%
>
> 参考：https://github.com/flameshot-org/flameshot/issues/760

![1](assets/02-00-kde-settings/2021-01-28-18-19-22.png)

## 亮度

在右下角的电池那里设置

![1](assets/02-00-kde-settings/2021-01-28-18-24-23.png)

## 取消自动休眠

在系统设置里面，power management，除了 button events handing，其他全关掉，并且把这一项的两个设为无动作

![1](assets/02-00-kde-settings/2021-01-28-18-23-29.png)

## 取消屏幕锁

系统设置 -> screen locking

![1](assets/02-00-kde-settings/2021-01-28-18-26-36.png)

## 设置开机不要打开上次的内容

![1](assets/02-00-kde-settings/2021-01-28-18-38-29.png)

## 解决切换显示器导致的特效关闭现象

> 参考：https://forum.manjaro.org/t/desktop-effects-have-been-suspended-kde-plasma/30705

1. 开启这个功能：System settings - Workspace Behavior - Desktop Effects enable “Background contrast”

    ![1](assets/02-00-kde-settings/2021-01-28-18-45-59.png)

1. 确保使用的是 OpenGL3.1

    ![1](assets/02-00-kde-settings/2021-01-28-21-16-28.png)

## 设置任务栏

1. 设置任务栏高度

    在状态栏处右击，选择 `edit panel`，然后在中间选择面板高度为 58

1. 设置任务栏自动隐藏

    依然先在状态栏处右击，选择`edit panel`，然后在右侧有`more options`，有一个`auto hide`

## 设置暗色主题

设置里搜 theme 或者 color，最好是 theme，可以联网下载暗色主题

建议用 ant-dark

![1](assets/02-00-kde-settings/2021-01-28-18-41-24.png)

## 设置外观风格

![1](assets/02-00-kde-settings/2021-01-28-19-18-58.png)

## 设置菜单栏

1. 设置系统内使用暗色菜单

    ![1](assets/02-00-kde-settings/2021-01-28-19-16-52.png)

1. 设置应用内使用暗色菜单

    ![1](assets/02-00-kde-settings/2021-01-28-19-56-10.png)

## 设置 icon

![1](assets/02-00-kde-settings/2021-01-28-19-10-27.png)

## 设置壁纸

**在桌面下右键单击空白处**，选择 configure desktop and wallpaper

![1](assets/02-00-kde-settings/2021-01-28-20-04-38.png)

## 设置开机启动引导的主题

直接用系统自带的`breeze`主题，但是背景图片换成墙纸

![1](assets/02-00-kde-settings/2021-04-09-18-18-18.png)

## 关闭开机读条动画

![1](assets/02-00-kde-settings/2021-06-06-10-59-00.png)

## 设置时区

1. 右下角点时间，设置时区和时间显示格式。时区按照大米哥，时间格式见下方

    ![1](assets/02-00-kde-settings/2021-01-28-18-32-22.png)

1. 系统设置里 time and zone，把自动更新时区打开

    ![1](assets/02-00-kde-settings/2021-01-28-18-35-07.png)

## 设置 konsole（可选）

> 如果后面使用其他终端模拟器（比如 Alaacritty 或者 Kitty），那么配置这个没有意义
>
> 如果要使用其他终端，就在设置里搜索`shortcuts`，然后搜索`konsole`，改为相应的终端模拟器即可

在 setting 里面先添加一个自定义 profile

settings -> manage profiles -> new

然后将其设置为 default profile

> :warning:以下对于 Konsole 的更改都是基于自定义 profile 的，不是 default profile

1. 设置 Konsole 外观主题

    ![1](assets/02-00-kde-settings/2021-01-28-18-56-47.png)

1. 设置 konsole 字体大小

    ![1](assets/02-00-kde-settings/2021-01-28-18-59-05.png)

1. 设置 konsole 隐藏菜单栏

    ![1](assets/02-00-kde-settings/2021-01-28-19-01-12.png)

## konsole 的快捷键设置

如果以后要用 alacritty 的话，在这里绑定 alacritty

![1](assets/02-00-kde-settings/2021-02-08-15-32-09.png)

## 取消 KDE Wallet 的密码

把第四步中的密码设置为空密码（什么都不输入直接确认）

![1](assets/02-00-kde-settings/2021-01-29-17-09-13.png)

## 连接 wifi 后避免下次连接需要密码

![1](assets/02-00-kde-settings/2021-06-06-09-45-28.png)

![1](assets/02-00-kde-settings/2021-06-17-11-06-18.png)

## 取消锁屏快捷键

注意图中有错误，应该把下面那一个`ctrl + alt + l`也去掉

![1](assets/02-00-kde-settings/2021-02-08-15-36-10.png)

## KDE 提升亮度快捷键

> 为了防止手贱把亮度设置到 0

![1](assets/02-00-kde-settings/2021-02-12-00-36-24.png)

参考：

-   https://peytondmurray.github.io/coding/brightness-control-manjaro-kde/#

-   https://forums.linuxmint.com/viewtopic.php?t=142807

## 更改左下角 settings 的图标为 manjaro

这个比较简单，右键后按照提示做即可

## 关于开机自启脚本与用户服务

### 开机自启脚本

> 参考：https://wiki.archlinux.org/index.php/KDE#Autostart

直接`settings -> autostart`手动添加

### 用户服务

> 参考：https://wiki.archlinux.org/index.php/Systemd_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)/User_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

systemctl --user

## 设置 Krunner 居中

![1](assets/02-00-kde-settings/2021-03-20-09-18-42.png)

## 设置 Caps Lock 为 ESC

![1](assets/02-00-kde-settings/2021-04-13-00-44-14.png)

在 vscode 里面需要加上一条，然后重启系统：

```json
"keyboard.dispatch": "keyCode",
```

## 设置默认应用

![1](assets/02-00-kde-settings/2021-04-13-19-24-49.png)

## 设置开机进入 CLI，然后从 CLI 进入图形界面

1. 开机进入 CLI

    ```text
    systemctl set-default multi-user.target
    ```

2. 要进入 GUI，只需要`startx`就可以。

3. 从 GUI 返回到 CLI，只需要“注销”，就回到了 CLI。

4. 想再次修改为默认进入 GUI 界面, 执行

    ```text
    systemctl set-default graphical.target
    ```

## 设置自动挂载 U 盘

![1](assets/02-00-kde-settings/2021-05-12-07-35-03.png)

## 设置默认应用程序

```text
sudo nvim /etc/xdg/kde-mimeapps.list
```
