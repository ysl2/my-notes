# vim-and-neovim

## 配置文件

> [vimrc 在 linux 中的位置](vimrc-location.md)
>
> neovim 配置文件位置在`~/.config/nvim/init.vim`

---

## Cheet Sheet

### 正常模式

#### 权限

-   `:w !sudo tee %` 以管理员权限写入

#### 光标与屏幕移动

-   `g_` 跳转到当前行的最后一个非空字符位置

-   `ctrl+e` 屏幕向下滚动一行

-   `ctrl+y` 屏幕向上滚动一行

#### 代码折叠

-   `zo` 打开一个折叠。
-   `zc` 关闭一个折叠。
-   `za` 当关闭时打开，当打开时关闭。
-   `zo`、`zc`、`za`  对应  `zO`、`zC`  和  `zA`；以递归形式改变折叠状态。
-   `zR` 打开全部折叠。
-   `zM` 关闭全部折叠。

### 可视模式

-   `gwip` Reflow Paragraph（直接选择光标所在的一整段或一整个函数）

### 退出

退出 vim 的快捷键，不需要进入命令编辑模式

-   `ZZ` 保存退出，等价于`:wq`

-   `ZQ` 不保存退出，q 表示放弃，等价于`:q!`

-   在命令编辑模式下：

-   `:q` 不保存退出

-   `:q!` 不保存强制退出

-   `:w` 保存文件但不退出 vi

-   `:w!` 强制保存，不推出 vi

-   `:w file` 将修改另外保存到 file 中，不退出 vi

-   `:wq` 保存退出，w 表示写入，不论是否修改，都会更改时间戳

-   `:wq!` 强制保存文件，并退出 vi

-   `:e!` 放弃所有修改，从上次保存文件开始再编辑

-   `:x` 保存退出，如果内容未改，不会更改时间戳

-   `:x` 和 `:wq` 的区别如下：

    1. `:wq` 强制性写入文件并退出（存盘并退出 write and quite）。即使文件没有被修改也强制写入，并更新文件的修改时间。
    1. `:x` 写入文件并退出。仅当文件被修改时才写入，并更新文件修改时间；否则不会更新文件修改时间。
       这两者一般情况下没什么不一样，但是在编程方面，对编辑源文件可能会产生重要影响。因为文件即使没有修改，`:wq` 强制更新文件的修改时间，
       这样会让 make 编译整个项目时以为文件被修改过了，然后就得重新编译链接生成可执行文件。这可能会产生让人误解的后果，当然也产生了不必要的系统资源花销。不过像是版本控制的软件一般首选还是比较文件内容，修改时间一般不加以理会。

### 多光标（仅在 vscode-vim 中有效）

Enter multi-cursor mode by:

On OSX, cmd-d. On Windows, ctrl-d.
`gb`, a new shortcut we added which is equivalent to cmd-d (OSX) or ctrl-d (Windows). It adds another cursor at the next word that matches the word the cursor is currently on.
Running "Add Cursor Above/Below" or the shortcut on any platform.
Once you have multiple cursors, you should be able to use Vim commands as you see fit. Most should work; some are unsupported (ref PR#587).

Each cursor has its own clipboard.
Pressing Escape in Multi-Cursor Visual Mode will bring you to Multi-Cursor Normal mode. Pressing it again will return you to Normal mode.

### [多文档/多窗口操作汇总](https://www.cnblogs.com/sunsky303/p/10998654.html)

#### [书签](https://www.jianshu.com/p/df10d30e8928)

-   `ma`或者`mA`

    大写字母是全局的，小写字母是当前文件的

#### 多标签（文件）切换

> 注：标签就是文件

-   `:tabo` 关闭其他标签，只保留当前激活的标签
-   `:tabs` List current Vim tabs

#### 多窗口切换

> 注意：在 vim 中，`tab`和`buffer`的概念是不一样的。`tab`是一个文件，`buffer`是分屏的窗口

-   `Ctrl+6`—下一个文件(vscode 未实现)
-   `:bn` 下一个文件(vscode 未实现)
-   `:bp` 上一个文件(vscode 未实现)

    1. 对于用`(v)split` 在多个窗格中打开的文件，这种方法只会在当前窗格中切换不同的文件。
    1. 通过 vim 打开多个文件（可以通过 `ctags` 或者 `cscope`）

-   `:ls`查看当前打开的 buffer（窗口）`ls` 的作用是显示缓存(vscode 未实现)
-   `:b num`切换窗口（其中 `num` 为 buffer list 中的编号）(vscode 未实现)

#### 多文档编辑

> vscode 里只有`:e`和`:f`能用

-   `:n` 编辑下一个文档。(vscode 未实现)
-   `:2n` 编辑下两个文档。(vscode 未实现)
-   `:N` 编辑上一个文档。注意，该方法只能用于同时打开多个文档。(vscode 未实现)
-   `:e` 文档名 这是在进入 vim 后，不离开 vim 的情形下打开其他文档。
-   `:e!` 重新载入当前文件
-   `bufdo e!` 重新载入所有的文件，`:bufdo`表示应用到所有的 buffer 中的文件
-   `:e#` 或 `Ctrl+ˆ` 编辑上一个文档,用于两个文档相互交换编辑时使用。`?#` 代表的是编辑前一次编辑的文档
-   `:files` 或 `:buffers` 或 `:ls` 可以列出目前 缓冲区 中的所有文档。加号 `+` 表示 缓冲区已经被修改过了。＃代表上一次编辑的文档，`%`是目前正在编辑中的文档(vscode 未实现)
-   `:b` 文档名或编号 移至该文档。(vscode 未实现)
-   `:f` 或 `Ctrl+g` 显示当前正在编辑的文档名称。
-   `:f 文档名` 改变编辑中的文档名。(file)

## 插件

### easymotion

```text
搜索单个字符
<leader><leader> s <char> <CR>

搜索任意字符串
<leader><leader> / <char> ... <CR>
```

### surround

关于标签举例：

按`v`后选中一段文本`123`，然后`Styu>`，`123`就会被标签`<yu></yu>`包裹，变成`<yu>123</yu>`

注意当选择单行的时候，必须通过`V`选择，不能只选择部分。如果选择部分的话会出 bug（这是由于`auto-close-tag`导致的），此时需要按`u`撤销一次

## global 命令删除空白行

> `n dd` 也能达到效果

1. `:g/^$/d` 删除所有空白行

    > `:%global/^$/delete` 一样的操作，只是上面的是缩写，这个是完全展开形式

    - `%`是默认的，表示对当前文档进行操作，因此可以省略（如果要对特定行数进行操作，用`10,20`代替，表示第 10 行到第 20 行）。

    - `global`可以简写为`g`

    - `delete`可以简写为`d`

    - `^$`是正则表达式，`^$`表示没有任何字符的一整行。`^`表示开头，`$`表示结尾，中间夹着的字符什么都没有，即一个空行

2. `:g/^\s*$/d` 删除所有空白行，以及包括控制字符的空白行

    - `\s*`用于匹配控制字符

    - 如果一个空行内有一些命令字符（不可见但客观存在，可以通过`:set list`查看），无法通过上面的方式删掉，就可以通过第三个式子删除。

3. `:g/^\_$\n\_^$/d` 在有多个连续空行的情况下，仅保留一个空行

4. `:g!` 在`g`后面加一个`!`表示反向匹配。`g!`可以缩写为`v`

    `:g!/./d` 反向删除所有不为空的行（实际上就是删除所有的空行）

    `:v/./d` 一样的效果

## 项目中全局替换

```vimscript
:cfdo %s/foo/bar/g | :w
```

或者用插件，比如`fzf.vim`，参考[这里](https://github.com/junegunn/fzf.vim/issues/528)

## 参考

https://blog.csdn.net/qq_30214939/article/details/73012738
