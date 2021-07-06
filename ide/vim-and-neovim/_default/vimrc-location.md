# vimrc文件的位置

配置文件在哪里

当我们使用Vim时, 你需要知道一系列的配置文件. 这些配置文件的位置依赖于Vim的安装位置和你所使用的操作系统.

通常, 有三个配置文件, 你是必须知道在哪里能找到的.

## vimrc

这是Vim最主要的配置文件. 它有两个版本, 全局版本(global)和用户版本(personal)).

全局vimrc文件放在你安装Vim的目录中. 你可以打开vim, 在普通模式下输入下面的命令来找出这个目录的位置

```bash
:echo $VIM
```

结果应该是这样的:

```bash
Linux: /usr/share/vim/vimrc

Windows: c:/program files/vim/vimrc
```

用户版本的vimrc文件放在你的主目录下. 主目录的位置依赖于你的操作系统. Vim最初是为Unix及类Unix操作系统提供的, 所以用户版本的vimrc文件都是通过在文件名的最前面加一个点来设置成隐藏文件. 这是在类Unix上设置隐藏文件的方法, 但不适用于Microsoft Windows. 所以呢, vimrc文件与操作系统有关. 应该是这样的:

```bash
Linux: /home/vim/.vimrc

Windows: c:/documents and settings/vim/_vimrc
```

不管怎么改用户版的vimrc文件, 其中的设置内容都是覆盖在全局vimrc文件中设置的内容. 这就意味着你可以**不需要去改变全局vimrc文件来进行配置Vim**

你可以在Vim的普通模式下输入下面的命令, 来找出Vim认为的你的系统的主目录的位置:

```bash
:echo $HOME
```

vimrc文件包含的是ex (vi的前身) 命令, 一条命令一行. 并且vimrc文件也是增加Vim配置信息的默认方式.

你的vimrc可以将其他的文件 (包含着配置信息) 作为外部资源. 在vimrc文件里, 你可用以source命令来实现:

```bash
source /path/to/external/file
```

这样可以使你的vimrc文件保持整洁, 并且你的设置会更加的结构 (更多的关于如何保持vimrc文件整洁的内容请参考附录B) .

## gvimrc

gvimrc文件是专为Gvim的配置文件. 它和上面提到的vimrc文件很相似, 并且是放在同一个目录下的 (也是分为用户版和全局版), 如:

```bash
Linux: /home/kim/.gvimrc
       /usr/share/vim/gvimrc

Windows: c:/documents and settings/kim/_gvimrc
         c:/program files/vim/
```

这个文件是用来设置只有Gvim才能使用的GUI设置.

## exrc

这是文件是用作与vi或ex向后兼容用的. 它也是和vimrc文件放在同一个目录, 当然也是分为用户版和全局版). 然而, 除非你想用vi兼容的模式来使用用Vim, 否则你根本就不会用到这个文件.
