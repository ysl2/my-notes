# 基于的 github 的 python 开源教学项目推荐及使用说明

## 前言

1. 本文的目标： 向你推荐一个我目前在照着学习的 github 上的一个 python 开源项目（10 万多个 star），并教你下载 github 的任何项目。之后带你用 vscode 运行一个 python 文件（vscode 不是重点，可以不学）。

2. 此文章力求“开箱即用”，只需跟随步骤照做即可。文章中会提到一些原理或其他的东西，是为了抛砖引玉。如果你有兴趣，可以自行搜索相关内容。我也会给相应的名词补充链接，这些链接不是必须要看的。建议在**完全读完文章**后，如果有兴趣，再去看这些拓展内容。

3. 我推荐的这个项目中的文章采用的是 markdown 语法，这是 github 上主流的文本语法（这个虽然不是本文的重点，但是非常非常非常建议学一下。很简单，b 站视频半小时就能上手并使用）。

4. github 是目前全球最大的代码托管平台（目前已被微软收购），虽然**没有被墙**，但是由于服务器在国外，因此国内访问请求大部分都遭到了[DNS 污染](https://zhuanlan.zhihu.com/p/107691233)，导致 github 上的图片加载不出来，访问也很慢，必须通过 github 的镜像站来访问。或者翻墙也可以，我后面也会提到我目前在用的翻墙工具（是收费的，到现在为止我用了一年半。价格我认为还可以接受。之前用过免费的太不稳定，并且维护的也很差劲。其中有一个套餐是一块钱的，但只能用一天，可以尝试一下）。

5. 此文章并不是劝退文，但我写着写着就感觉门槛变高了。本文的主要难点来自 vscode 相关内容。因此我还是更建议用 Pycharm，而 vscode 可以不看，这并不影响学 python。详情见下文。

6. 文章中所有涉及”腾讯软件中心“的内容，一律选择”普通下载“，不要选”高速下载“。

7. 如果出现任何链接打不开或者乱码的情况，说明 IE 内核版本过低，建议用 firefox 浏览器打开。

8. 对于链接，按住`ctrl`再用鼠标点它，可以在新的标签打开

## 环境准备

1. git

    - 下载：

        官网（国外，慢，别用这个）：[https://www.git-scm.com/](https://www.git-scm.com/)

        国内下载地址（清华大学开源软件镜像站主页）： [https://mirrors.tuna.tsinghua.edu.cn/#](https://mirrors.tuna.tsinghua.edu.cn/#)

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-00-07-36.png)

        注意自己电脑是 32 位还是 64 位，现在一般都是 64 的

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-00-09-49.png)

    - 安装：一直点”下一步“即可

2. github 的网址

    官网（有一定几率能打开。如果打不开，是正常现象，这是由于 DNS 污染造成的）： [https://www.github.com/](https://www.github.com/)

    如果官网能直接打开，就用官网就行了

    镜像站（只是其中一个，如果需要更多，我再详述）： [https://hub.fastgit.org/](https://hub.fastgit.org/)

    几个注意事项：

    - 就算是镜像站，速度可能也很慢，但多等等或者刷新几次，会打开的

    - 有时镜像站可能会出现以下情况。这是正常的，等一分钟左右或者多刷新几次。注意网址是否是 [https://hub.fastgit.org](https://hub.fastgit.org) 主页。如果不是，请删掉后面乱七八糟的字符重新进主页。

        > 效果如下图。有时候是`Whoa There!`，但是我写这个文章的时候，网络环境有点好，没能成功试出来。

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-07-20-29-07.png)

    - 镜像站不能注册和登录帐号，只能用于浏览代码。并且由于不太稳定，因此一般只用来搜索，然后通过 git 下载到本地查看。如果你想注册 github 帐号，就必须得翻墙或者改 hosts 文件了（改 hosts 见我上面 DNS 污染引用的链接文章）

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-07-20-25-07.png)

3. 我推荐的 python 项目

    原链接（github 官网链接）： [https://github.com/jackfrued/python-100-days](https://github.com/jackfrued/python-100-days)

    镜像站链接： [https://hub.fastgit.org/jackfrued/Python-100-Days](https://hub.fastgit.org/jackfrued/Python-100-Days)

    注意看仓库的说明书（`README.md`文件），里面提到有一个对于基础部分的补充说明，这个补充说明是另一个项目，对新手更友好。我目前学的是这个补充项目。点开的时候注意链接是 github 官方的，需要你换成镜像站的链接（换的方法见此文章下方内容）。

    几个注意事项：

    - github 把每个项目称为”仓库(repository)“

    - 从上面两个链接格式中，你会发现，每个仓库的链接格式为：

        ```text
        https://github.com/{用户名}/{仓库名}
        ```

        而对应的镜像站链接为：

        ```text
        https://hub.fastgit.org/{用户名}/{仓库名}
        ```

        并且不同的用户可以拥有相同的仓库名。因为一个仓库的唯一性是由”用户名“与”仓库名“共同保证的

    - ”用户名“与”用户昵称“是**可以**不一样的（但是也可以一样）。比如，我的用户名是`ysl2`，但我的用户昵称是`Sollie Yu`。用户名不能重复，并且可以用于登录，而用户昵称则完全相反。

    - 在 github 上，**当且仅当**文件名是`README.md`时，这个文件才能被直接作为说明文档渲染，并展示在首页。否则，就只能点开之后查看内容。另外，`README.md`可以出现在子文件夹中，作为对子文件夹的说明文档。

4. Typora

    markdown 编辑器。Typora 与 markdown 文件的关系就相当于 office 与 doc 文件的关系

    官网（国外下载链接，需翻墙。建议使用下面的）： [https://typora.io/](https://typora.io/)

    下载地址（腾讯软件中心）： [https://pc.qq.com/detail/15/detail_22855.html](https://pc.qq.com/detail/15/detail_22855.html)

    只需要掌握一个快捷键`ctrl + /`，用于切换源文件与渲染后的文件，这可以帮你快速上手 markdown。

    另外，obsidian 也是一个 markdown 编辑器，用于链接多篇笔记形成网状笔记。但这个属于项目型的笔记软件。日常轻度使用的话，Typora 就够用。

5. python

    官网（国外，墙，慢）： [https://www.python.org/](https://www.python.org/)

    下载地址（华为云）：[https://mirrors.huaweicloud.com/python/?C=M&O=D](https://mirrors.huaweicloud.com/python/?C=M&O=D) ，选择第一个（最新版本），然后找到后缀为`amd64.exe`的（amd64 即 64 位），下载。

    安装：

    - 如果你没有遇到`Setup Failed`，就继续往下看。否则，参考[这篇文章](https://www.cnblogs.com/ButterflyStars/p/13153397.html)排错

    - 安装时先记住 python 的安装路径在哪（后面需要用到），最好截一下图。（比如下图）

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-07-232449.png)

        ```text
        # 我的安装路径：

        C:\Users\yusoli\AppData\Local\Programs\Python\Python39
        ```

    - 安装时一定注意，勾选图中`Add to PATH`选项，否则需要自己手动配置环境变量。不建议使用“自定义安装”，除非你真的确定安装的每一步都做了些什么

    测试：

    - 键盘按`win + R`，输入`cmd`并回车，打开终端。

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-07-232640.png)

    - 输入`python`，如果正常，会进入 IDLE 如下图（输入`exit()`退出 IDLE）

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-07-232612.png)

6. 一个 IDE（集成开发环境）

    - 比较建议的是 Pycharm，所有东西都已经设置好，开箱即用。这个是和 intellij-idea 同一家公司（jetbrains）的产品，帐号可以用同一个。另外，如果有 edu 后缀的邮箱（学生邮箱，山财在校期间可以用学号注册，并且终生可使用），可以终生白嫖（jetbrains 的东西都是每年激活一次，但是可以一直激活。一年之后到期了再去激活就行）。如果没有 edu 邮箱，网上的破解教程也很多。如果懒得找破解教程，淘宝上也有卖教程的，也有直接远程帮你配置的。或者直接淘宝买 Pycharm 帐号（一般不是永久的，我没买过，不知道真的假的）。方法总比困难多，这里由于我已经很久没有使用，细节性的东西忘记了，不详述了。

    - 另一个选择是 vscode，vscode 只是一个代码编辑器，本身不提供任何代码运行或者 debug。所有额外功能都是通过社区中的插件完成。因此 vscode 并不局限于某种语言，但配置也相对麻烦。如果确定使用 vscode，见文章末尾的章节。否则可以不看。

        vscode 的优势在于：

        - 跨平台：所有配置能通过微软帐号或者 github 帐号云端保存，下次换机直接登录就同步所有设置、快捷键与插件列表。
        - 轻量：额外功能通过插件完成，并且可以控制每个插件的开/关。因此对不同的语言环境可以按需开启不同的插件。
        - 不局限于语言：对于任何语言，都有很多插件用于提供相应支持。
        - 开源免费：每个人都可以在 github 上的 vscode 官方仓库提 issue 或者提交代码，并且 vscode 正式版每月更新一次（测试版每天更新一次），这吸引了很多开发者为 vscode 写插件。因此插件生态非常完备。而开源则意味着不是商业应用。

        vscode 的劣势在于：

        - 不是开箱即用：这个只能是有需求就去解决，我现在也是边用边学。目前我主要用 vscode 写 C/C++，java，前端三件套（html，css，javascript），mysql，tomcat，markdown，python，bash，并且也在 vscode 上刷 leetcode 和知乎（有 leetcode 插件和知乎插件）。还有我刚安装好还没用过的 Matlab 也有插件。另外还有一些用于远程协作的插件（remote-ssh），现在插件装了 115 个。还有一些我仅听说过的更离谱的插件（炒股，网易云，小霸王游戏机等等）。如果有时间，我会详细说一下怎么弄这些环境。当然，如果你有需求，可以自行搜索，或者直接看 vscode 的官方文档和插件对应的 github 仓库中的`README.md`。

## 下载 github 上的项目到本地

> 注：这只是对于无法翻墙的一个解决方案，缺点也很明显：本地不能收到 github 云端的仓库更新（其实可以用 git pull，但是如果本地版本有改动，则需要 git merge 来手动处理冲突。这里就需要系统地学一下[git 的使用方法](https://git-scm.com/book/zh/v2)了）。如果能翻墙，当然这部分就不需要看了，直接 github 在线预览就行。我感觉有个梯子还是挺重要的，毕竟学习还需要看英文文献，而做开发还得 google 或者 stackoverflow 啥的，翻墙始终是逃不过的。

先新建个文件夹，并进入此文件夹

在空白处右键，选择`git bash here`，会出现以下终端：

![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-11-16-57.png)

在打开的终端中输入以下内容：

```text
# `#`开头的是注释，不要输入到终端里
# 下面每行打完之后，敲一下回车。把大括号及大括号中的内容改成你自己的相关信息
# 这里以100day为例。那个50day的道理一样，改一下仓库名就行
# 注意clone用的地址后面有个.git，和普通网站不一样
# 这里采用的是通过镜像站克隆到本地的方法，所以下载速度会比直接从github克隆更快

git config --global user.name '{你的名字}'
git config --global user.email '{你的邮箱}'
git clone https://hub.fastgit.org/jackfrued/python-100-days.git
```

![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/f419c28c34f4bd742f78cfb283acf0b2a4fcd3b85658bd8bd96c186b931f75cb.png)

等待进度结束，此时云端内容就已经下载到本地了。

以`.md`为后缀的就是 markdown 文件，可以用 Typora 打开。按`ctrl + /`可以切换为源代码，可以帮你更好地理解 markdown。

此时，就能查看项目内容了。至于写代码，我建议用 pycharm，或者 vscode。pycharm 我用的不多，以下是我用 vscode 写 python 的方法。

## 关于 vscode 的 python 开发环境配置

> 注意：
>
> 1. 这部分不是必须要看的，用 pycharm 也一样可以写 python
> 2. vscode 和 vscodium 是两回事，建议使用 vscode，不要用 vscodium
> 3. vscode 和 vs(visual studio)也是两回事。但 vscode 和 vsc 是一回事
> 4. vscode 的 C/C++配置是最难的，因为涉及到项目构建等问题，需要自己写 CMake，而 CMake 实际上是另一种语言。我真不理解为啥微软对自家的主力语言支持的却这么差。其他的基本安上插件就能用，就算麻烦的也有一键安装所有插件的插件包。但是 C/C++就特别难弄，并且选择余地也大，每个人弄的都不太一样。

vscode 的 python 配置是所有语言中最简单的，只需要两个插件就能运行起来。

1. 下载 vscode

    vscode 官网（国外，下载慢）：https://code.visualstudio.com/

    vscode 国内下载地址（腾讯软件中心）：https://pc.qq.com/detail/16/detail_22856.html

2. 下载 vscode 插件

    下图是下载并安装一个插件的一般流程（以 python 为例）

    > 注意，这里的 python 只是一个插件，并不是解释器（解释器在上面已经安装过了），目的是把 python 解释器集成到 vscode 里

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-07-233431.png)

    第 5 步可以查看某个插件所提供的所有设置字段。这些字段是你自己可以自由定义的。下面会提到，目前先不用管。

    对于 python，需要安装两个插件：

    ```text
    python（用于集成python解释器到vscode中）
    tabnine（以AI的方式提供代码补全，这个插件不仅用于python，也适用其他语言）

    # 注：tabnine不用配置，开箱即用
    ```

3. 配置插件（以 python 插件为例）

    现在你可以尝试写一个 python 文件，并运行了。

    新建文件，在 vscode 左上角（下图画圈的位置。它右边那个是新建文件夹）。或者右键点击空白处选择`new file`

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-08-33-17.png)

    随便起个文件名，然后在文件中输入以下内容：

    ```python
    print('hello world!')
    ```

    有两种方法运行文件，二选一，但第二种是通用方法，也需要掌握（如果现在运行出错，是正常现象。接着往下看后面我会解决）：

    - 按`F5`（`F5`是 debug 的快捷键，但是由于目前没有打断点，因此会直接运行程序），然后选择第一个。
    - 按快捷键`ctrl + shift + p`（此快捷键呼出了命令面板。命令面板提供了 vscode 及其插件的所有可执行命令，是通用方法），输入`run`，找到下图这条。

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-08-42-54.png)

        命令面板中执行过的命令，下次会优先显示。因此下一次执行的时候不用费劲往下翻页了。另外，如果下面控制台没有反应，就再执行一次。如果报错，先不用管。

    目前并不能开箱即用，因为 python 插件找不到刚才安装的解释器的路径，需要手动配置一下路径。此时按上述第 5 步，打开 python 插件提供的所有设置字段，如下：

    > 下图是我把所有箭头收缩后的效果。

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-08-21-54.png)

    对于用户，只需注意上面画圈的两个。settings 是插件提供的所有设置字段及每个字段表示的含义，commands 指这个插件提供的所有可执行的命令，而命令可以通过命令面板搜索到（因此不用再记快捷键了。当然，一些常用的命令可以绑定一下快捷键）。

    其中 settings 字段里，可以找到下面这一条（按住鼠标拖动选择字段后按`ctrl + c`复制这个字段）：

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-08-30-14.png)

    进入用户设置页面：按`ctrl + shift + p`，输入`settings`，找到下面这条

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-08-56-04.png)

    vscode 为用户提供了`图形界面方式配置`和`json文件配置`两种方式。实际上，通过图形界面配置，最终也是保存到 json 文件里了，只是 vscode 帮你做了这件事而已。因此我更推荐直接自己改 json 文件。

    通过下面的按钮可以打开 json 文件。

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-09-10-50.png)

    （当然，刚才也可以直接通过命令面板绕过图形界面，直接打开 json 文件：

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-09-17-10.png)

    json 文件语法很简单，下面是几点注意事项：

    - json 文件最外层有一个大括号。所有内容都必须写在这个大括号里。因此下面关于 json 说的”最后加上“等这种字眼，指的全是”在大括号内最后加上“。

        ```jsonc
        {
            // json文件格式举例

            // 字符串
            // 注意引号和冒号都是英文的，而且冒号后面必须有一个空格，并且每个键值对后面都必须有一个英文逗号（json的最后一个键值对的逗号必须省略，jsonc无所谓。后面会讲二者的区别）
            "键1": "值1",
            // 布尔值
            "键2": true,
            // 列表
            // 列表用中括号表示，其中每个字段值之间用英文逗号隔开，并且列表内的逗号后面必须有一个空格
            "键3": ["值1", "值2", "..."]

            // 所有内容必须都写在最外层大括号里面
            // json和jsonc是两回事，但是jsonc沿用了json的语法，因此jsonc算是json的超集
            // 正规json文件不允许有注释。但vscode使用的是jsonc(json comment)，可以用双斜杠写注释。另外，jsonc语法比json宽松了一些，jsonc文件的最后一个键值对，最后有没有逗号都行。但是对于json，最后一个键值对的逗号必须省略
        }
        ```

    - 如果你的`settings.json`文件已经有字段了，请务必注意最后一条后面必须有英文逗号。因为 json 文件中，键值对是以逗号分开的。

        ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-09-24-16.png)

    在 json 文件最后一行（大括号内的最后一行）添加：

    ```jsonc
    "python.defaultInterpreterPath": "C:\\Users\\yusoli\\AppData\\Local\\Programs\\Python\\Python39\\python.exe"

    // 1. 这个字段对应的值就是我上面说的要你记住的python安装的位置，但是后面需要加上python.exe，也就是必须精确到可执行程序（exe文件）才行。
    // 2. linux下因为有$PATH环境变量，因此在linux下，插件作者提供的”python“作为默认值，是可以作为系统级别直接运行python文件的，但是windows就稍微麻烦一点。如果你想尝试日常使用linux系统，我这里有我之前学习时做的笔记可供你参考。
    // 3. 注意上面的格式，是两个反斜杠，因为反斜杠是控制字符，需要再加一个用来转义。
    // 4. 再罗嗦一句，一定注意上一条的最后有没有英文逗号。没有的话需要加上。并且上面的英文冒号后面有个空格。json和jsonc文件的格式还是挺严格的。
    ```

    在完成上述步骤后，现在就能运行 python 程序了（按`F5`或者呼出命令面板都行）

    > 如果你需要格式化代码，需要 autopep8，这个东西是需要通过 python 的包管理器（pip）下载的。或者在你通过 vscode 的命令面板执行`format document`命令时，vscode 也会提醒你需要下载 autopep8，并在你同意下载后通过 pip 下载。这个下载过程与 vscode 无关。但需要注意一件事，pip 默认的源在国外，需要你配置一下国内源，否则下载会失败。关于配置国内源，windows 系统我没有配置过，可以自行搜索一下，但是我有我 linux 系统下的配置供你参考，注意这是[github 链接](https://github.com/ysl2/.dotfiles/blob/master/pip/.config/pip/pip.conf)

    一些补充说明：

    - 目前你刚才改的 vscode 的配置并没有在云端同步。但是当你登录微软帐号后，就能自动同步设置了。另外，有个插件叫`settings sync`，强烈建议用这个插件配合微软帐号做双保险。我有两次从 linux 切换到 windows 时，备份没有同步的情况，但最终是这个`settings sync`插件救了我。
    - vscode 使用时主要专注于三个方面：`settings（设置）`，`commands（命令）`，`keyboard shortcuts（快捷键）`，这三项都是你可以自定义的。
    - vscode 详细使用方法实在太多，我目前也是在学习中。但是我可以给你推荐一个大佬：知乎用户[韩骏](https://www.zhihu.com/people/formulahendry)

## 后记

1. 此文章怎么写的

    ![1](https://myheap.coding.net/p/public-picture-bed-01/d/public-picture-bed-01/git/raw/master/2021-04-08-08-24-26.png)

    - 语法：markdown

    - 环境：vscode + vscode 的 markdown 相关插件

        ```text
        # 我使用的markdown相关插件列表

        ## 重要：指markdown常用的插件，并且提供了最基本功能
        ## 通用：不仅markdown能用，其他也能用

        csholmq.excel-to-markdown-table
        kisstkondoros.vscode-gutter-preview
        dbankier.vscode-instant-markdown
        bierner.markdown-emoji
        （重要）yzhang.markdown-all-in-one
        （重要）mathiassoeholm.markdown-link-updater
        （重要）davidanson.vscode-markdownlint
        （重要）mushan.vscode-paste-image
        esbenp.prettier-vscode（通用）
        gera2ld.markmap-vscode
        marp-team.marp-vscode
        tchayen.markdown-links
        ianjsikes.md-graph
        （重要）jakob101.relativepath（通用）
        （重要）TabNine.tabnine-vscode（通用）
        dougfinke.vscode-pandoc（通用）
        （重要）usernamehw.errorlens（通用）
        ```

    - 渲染：pandoc 把 markdown 文件转换成 html 网页（pandoc 不仅可以转换 markdown，还可以转换 LaTeX，并且可以把它们转换成 html，pdf，word 等多种格式。以后写论文可能会用到这个工具，先注意一下这个）

2. 我的梯子

    ```text
    xindongli130.xyz
    ```

    网站内有教程，所有平台都能用（windows，linux，macos，android，ios）。

    网站会更新，我这一年半时间里总共更新了三次（`125`，`129`，`130`）。他们公告里有个邮箱，可以给这个邮箱发个邮件，这样网站更新之后会给你发邮件提醒。

3. 我的 github

    用户名：ysl2

    我的所有笔记：`my-notes`仓库

    我的 linux 系统配置：`.dotfiles`
