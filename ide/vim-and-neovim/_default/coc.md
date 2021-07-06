> 原链接：https://www.chengxuzhilu.com/2409.html

# 让 Vim 成为有 IDE 功能的代码编辑器

> 操作系统: Ubuntu 20.04 LTS x64 Gnome Desktop for WSL 2
>
> 经测试，本文内容可在拥有图形界面的 Ubuntu 18.04 和 Ubuntu 20.04 上部署。
>
> 没有图形界面的命令行下未经测试，不一定兼容。
>
> 本人的 Vim 配置的 Github 仓库网址是：　https://github.com/navinxu/nx_vim

## 前言

本文主要讲述应用 Vim 的一些插件协助 YouCompleteMe 和 Coc-nvim 两款代码补全插件完成简单 IDE 的搭建（为了减弱 Vim IDE 的搭建难度，自 2020 年 9 月 23 日起不启用 YCM，所有本人配置出来所支持的编程语言皆使用 Coc-nvim 进行代码智能补全。也就是说 YouCompleteMe 已经退出历史舞台，但它的安装配置仍然会在本文中提到），集代码补全、代码错误提示、文件管理、Git 发现、文本和文件/目录的搜索于一身。如果有新想法，本人会持续更新本文。

注意：本文依赖的是本人的 Vim 配置，如果换了新的环境，或者别的配置，本文的一些配置可能会失效，或者出现错误。

本文的一些安装方法是通用的，这里说的通用是指只要根据环境的变化对配置方法进行少量的修改不影响使用，如果你在配置自己的 Vim 时使用了本文的方法，但是出了问题，可以与本人联系，我们一起探讨，一起进步。联系邮箱：admin@navinxu.com 。

关于本人 Vim 配置设定的一些快捷键，由于还没有固定下来，以后会贴在 README 文件的。

在这个配置的使用中有任何问题可以与我联系，只要有空，就会第一时间回应。

由于国内外之间的网络带宽和时延的原因，本文所书的一些下载速度会很慢，例如要从 Github 拉仓库内容到本地，或者下载一些必要的文件。这时可能会用上直通国外网络的技术，如果是 Socks5 代理，可以使用 Proxychains 这个软件，安装方式如下：

```text
sudo apt-get install -y proxychains
```

配置 Proxychains :

```text
sudo vim /etc/proxychains.conf
# 然后将文件底部的 socks4 改为 socks5，
# 以及（可能）还要修改 IP 地址或端口，看情况而定。
# 保存并退出文件，修改在该程序重新运行时生效。
```

使用 Proxychains :

```text
proxychains git clone https://github.com/navinxu/nx_vim.git
proxychains wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
```

## 安装 Vim/NeoVim

要求的 Vim 版本是 >= 8.1，或者最新（最好是）版本的 NeoVim。

### 如果使用 Vim

```text
# Ubuntu 20.04，默认是 Vim 8.1
sudo apt-get install -y vim-gtk3

# 而 Ubuntu 18.04，默认是 Vim 8.0，
# 要想安装符合条件的 Vim 版本，
# 则必须用第三方软件库，
# 安装方法请参阅：https://www.chengxuzhilu.com/2233.html
```

### 如果使用 NeoVim

#### 下载 NeoVim

到 https://github.com/neovim/neovim/releases 下载最新版本的 NeoVim，在资源（Assets）那里选择 “nvim.appimage” 这个来下载。

下载时可能要连接外网。

```text
# 给予 nvim.appimage 文件可执行的仅限
cd /path/to/nvim/download/directory
chmod +x nvim.appimage
sudo cp nvim.appimage /usr/local/bin/nvim
# 打开并编辑用户 Home 目录下的 .bashrc 文件
vim ~/.bashrc
# 添加以下两行
# 1.
alias vi="nvim "
# 2.
alias vim="nvim "
# ESC -> :wq 保存退出编辑
# 终端上执行
source ~/.bashrc
```

## 安装 Git

```text
sudo apt-get install -y git
```

## 从 Github 下载 Vim 配置文件

```text
cd ~
git clone https://github.com/navinxu/nx_vim.git .vim
```

## 新建插件放置目录

```text
mkdir ~/.vim/bundles
```

## 创建指向 .vim/vimrc 的软链接 ~/.vimrc

```text
ln -sf ~/.vim/vimrc ~/.vimrc
```

## 配置 NeoVim （如果选择的是它）

```text
ln -sf ~/.vim ~/.config/nvim
```

## 安装依赖(通过 apt)

```text
# 确保 gcc >= 8.0
# 如果不需要 YCM
sudo apt-get install -y python3-dev gcc-8 g++-8 npm nodejs python3 silversearcher-ag ack tidy python3-pip fonts-powerline shellcheck ispell flake8 curl ctags --fix-missing
# 如果需要 YCM
sudo apt-get install -y build-essential cmake python3-dev gcc-8 g++-8 cscope ctags npm nodejs python3 silversearcher-ag ack tidy python3-pip fonts-powerline shellcheck ispell flake8 curl ctags --fix-missing
```

## 更改 npm 为国内源

```text
npm config set registry https://registry.npm.taobao.org
```

## 更新 npm 和 nodejs 的版本

```text
sudo npm install -g -U npm
sudo npm install -g -U n
sudo n stable
# 如果下载顺利
sudo ln -sf /usr/local/bin/node /usr/bin/node
sudo ln -sf /usr/local/bin/node /usr/bin/nodejs
# 如果无法下载
# 可以把安装程序打印出来的 Node 下载地址复制到浏览器，
# 然后下载到本地，再把解压得到的目录下面的所有文件（不包括文件夹本身）
# 复制到 /usr/local/n/versions/node/14.16.0/ 目录（当前版本为 14.16.0）
sudo cp -vfr ~/Downloads/node-v14.16.0-linux-x64/* /usr/local/n/versions/node/14.16.0/
# 复盖原有的 node 和 nodejs 两个可执行文件
sudo ln -sf /usr/local/n/versions/node/14.16.0/bin/node /usr/bin/node
sudo ln -sf /usr/local/n/versions/node/14.16.0/bin/node /usr/bin/nodejs
```

## 安装依赖(通过 npm 安装)

```text
sudo npm i -g eslint
sudo npm i -g jsonlint
sudo npm i -g stylelint
sudo npm i -g flow-bin
```

## 安装 mdl 用于 MarkDown 语法提示

```text
# 安装 Ruby
sudo apt-get install ruby -y
sudo gem install mdl
```

## 创建 python3 的软链接 python

编译和运行 YCM 必须要有

```text
sudo ln -sf /usr/bin/python3 /usr/bin/python
```

## 安装依赖(通过 pip3 安装)

1. 更改 pip3 的源指向国内源

    ```text
    mkdir ~/.pip
    touch ~/.pip/pip.conf
    gedit ~/.pip/pip.conf
    ```

    键入以下内容到 pip.conf 文件：

    ```text
    [global]
    index-url = https://pypi.tuna.tsinghua.edu.cn/simple
    ```

2. 安装依赖

    ```text
    sudo python3 -m pip install -U pip
    python3 -m pip install --user powerline-status
    sudo python3 -m pip install vint
    ```

## 安装 composer (Phpactor 插件需要)

1. 首先安装 PHP(保证 PHP >= 7.3,这里安装 7.4，Ubuntu 20.04 提供 PHP 7.4 直接安装):

    ```text
    sudo apt-get install -y \
    php7.4            php7.4-enchant    php7.4-mbstring   php7.4-snmp \
    php7.4-bcmath     php7.4-fpm        php7.4-mysql      php7.4-soap \
    php7.4-bz2        php7.4-gd         php7.4-odbc       php7.4-sqlite3 \
    php7.4-cgi        php7.4-gmp        php7.4-opcache    php7.4-sybase \
    php7.4-cli        php7.4-imap       php7.4-pgsql      php7.4-tidy \
    php7.4-common     php7.4-interbase  php7.4-phpdbg     php7.4-xml \
    php7.4-curl       php7.4-intl       php7.4-pspell     php7.4-xmlrpc \
    php7.4-dba        php7.4-json       php7.4-readline   php7.4-xsl \
    php7.4-dev        php7.4-ldap            php7.4-zip
    ```

2. Ubuntu 18.04 安装 PHP：

    ```text
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update

    # 安装 7.4 版本
    sudo apt-get install -y \
    php7.4            php7.4-enchant    php7.4-mbstring   php7.4-snmp \
    php7.4-bcmath     php7.4-fpm        php7.4-mysql      php7.4-soap \
    php7.4-bz2        php7.4-gd         php7.4-odbc       php7.4-sqlite3 \
    php7.4-cgi        php7.4-gmp        php7.4-opcache    php7.4-sybase \
    php7.4-cli        php7.4-imap       php7.4-pgsql      php7.4-tidy \
    php7.4-common     php7.4-interbase  php7.4-phpdbg     php7.4-xml \
    php7.4-curl       php7.4-intl       php7.4-pspell     php7.4-xmlrpc \
    php7.4-dba        php7.4-json       php7.4-readline   php7.4-xsl \
    php7.4-dev        php7.4-ldap            php7.4-zip

    # 安装 7.3 版本
    sudo apt-get install -y \
    php7.3            php7.3-enchant    php7.3-mbstring   php7.3-snmp \
    php7.3-bcmath     php7.3-fpm        php7.3-mysql      php7.3-soap \
    php7.3-bz2        php7.3-gd         php7.3-odbc       php7.3-sqlite3 \
    php7.3-cgi        php7.3-gmp        php7.3-opcache    php7.3-sybase \
    php7.3-cli        php7.3-imap       php7.3-pgsql      php7.3-tidy \
    php7.3-common     php7.3-interbase  php7.3-phpdbg     php7.3-xml \
    php7.3-curl       php7.3-intl       php7.3-pspell     php7.3-xmlrpc \
    php7.3-dba        php7.3-json       php7.3-readline   php7.3-xsl \
    php7.3-dev        php7.3-ldap            php7.3-zip
    ```

    安装有些慢,如果实在太慢,可以先按 Ctrl+c 结束安装,然后再次运行,经过多次这样的操作就可以安装成功.

3. 安装 composer

    参见: https://getcomposer.org/download/

4. 配置 Composer 国内镜像

    ```text
    composer config -g repo.packagist composer https://packagist.phpcomposer.com
    ```

依赖安装完成.

## 开始安装 Vim 插件

1. 首先进入 Vim (在插件还没有安装好之前,会有错误提示,不过以后会没有的).
2. 在命令/一般模式下输入 :PlugInstall.之后要耐心等待,毕竟 Github 不在国内.若是遇到下载错误,那必须尝试退出然后再次进入 Vim 执行同一命令,直到 Finishing ... Done! 出现.

3. 如果想要安装 YouCompleteMe 插件，那么请完成以下两个步骤：

    1. 在 vimrc.bundles 文件中取消 Plug 'ycm-core/YouCompleteMe' 一行的注释，保存文件但不退出，并且执行:so % 和 :PlugInstall 两个 Vim 命令。
    2. 安装好所有的插件后，在 vimrc.plugin.conf 文件取消 source ~/.vim/ycm-config.vim 一行的注释，然后保存文件并且退出。在重新用 Vim 打开文件时生效。

## 安装 Phpactor

1. 进入 ~/.vim/bundles/phpactor 再执行一下 composer 命令,直到依赖安装完成为止:

    ```text
    cd ~/.vim/bundles/phpactor
    composer install
    vim ~/.bashrc
    # 追加以下内容：
    export PATH="${HOME}/.vim/bundles/phpactor/bin:${PATH}"
    # 保存退出
    # 使生效
    source ~/.bashrc
    ```

## 安装配置 Coc-nvim

YCM 可以作为 Phpactor 的前端，同样地，Coc-nvim 也可以，貌似 Coc-nvim 更加易用一点。本人这个配置不单止 PHP 使用 coc，而且也在 C/C++ 上应用。

### 首先创建以下文件并执行一次

注释部分因为已经完成或者没有必要而不执行。

```text
vim ~/.vim/coc-automation-script.sh
```

该文件内容在 https://github.com/neoclide/coc.nvim/wiki/install-coc.nvim 页面的底部，仅供参考。

```text
#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

### # Install latest nodejs
### if [ ! -x "$(command -v node)"  ]; then
###         curl --fail -LSs https://install-node.now.sh/latest | sh
###             export PATH="/usr/local/bin/:$PATH"
###                 # Or use apt-get
###                     # sudo apt-get install nodejs
### fi
###
### # Use package feature to install coc.nvim
###
### # for vim8
### mkdir -p ~/.vim/pack/coc/start
### cd ~/.vim/pack/coc/start
### curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
### # for neovim
### # mkdir -p ~/.local/share/nvim/site/pack/coc/start
### # cd ~/.local/share/nvim/site/pack/coc/start
### # curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json  ]
then
      echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
```

保存，退出。

```text
chmod +x ~/.vim/coc-automation-script.sh
bash ~/.vim/coc-automation-script.sh
# 安装 pynvim ，以让 neovim 支持 python
sudo python3 -m pip install pynvim
```

### 在 Vim 内，:CocConfig 打开 Coc 的配置文件

然后在 `.vim` 目录下会有个 `coc-settings.json` 文件，本文后面如无特殊说明，关于 coc.nvim 插件的配置均在此文件内。

文件内容请参考：https://phpactor.readthedocs.io/en/develop/lsp/vim.html

### 在 Vim 内，安装 Coc 的插件（Coc extensions）

#### coc-clangd

1. 此插件作为 clangd 的前端，为 C/C++/ObjectC 提供代码提示服务。
2. Clangd 的安装在本文的后面在介绍 YouCompleteMe 时有介绍。
3. 安装方法： :CocInstall coc-clangd
4. 配置：

    vim .vim/coc-settings.json

    ```json
    "clangd.enabled": true,
    "clangd.path": "clangd"
    ```

具体配置请参阅： https://github.com/clangd/coc-clangd

#### coc-css

1. 此插件作为 css (层叠样式表) 对 Coc 前端代码提示提供服务端功能。
2. 安装方法： `:CocInstall coc-css`
3. 配置：

    ```json
    "css.enable": true,
    "css.trace.server": "verbose"
    ```

具体配置请参阅： https://github.com/neoclide/coc-css

#### coc-emmet

1. 为 coc.nvim 提供 Emmet 支持。
2. 安装方法： `:CocInstall coc-emmet`
3. 配置：

    ```json
    "emmet.includeLanguages": {"vue-html": "html", "javascript": "javascripttreact"},
    "emmet.excludeLanguages": ["markdown"],
    "emmet.optimizeStylesheetParsing": false
    ```

    配合 https://github.com/mattn/emmet-vim 使用。

具体配置请参阅： https://github.com/neoclide/coc-emmet

#### coc-html

1. 为 coc.nvim 提供 Html 代码提示后端
2. 安装方法： `:CocInstall coc-html`
3. 配置：

    ```json
    "html.enable": true,
    "html.trace.server": "messages",
    "html.filetypes": ["html","handlebars","htmldjango","blade","phtml"],
    "html.format.enable": true,
    "html.format.unformatted": null,
    "html.format.contentUnformatted": "pre,code,textarea",
    "html.format.indentInnerHtml": true,
    "html.suggest.html5": true,
    "html.autoClosingTags": true
    ```

具体配置请参阅： https://github.com/neoclide/coc-html

#### coc-java

1. 这是 Java 的代码补全 Coc 扩展，以 jdt.ls 为后端。
2. 注意：一定要在打开 Java 代码文件之前完成 coc-java 扩展的所有依赖配置
3. 安装： `:CocInstall coc-java`
4. 安装依赖：

    - 到 https://www.oracle.com/java/technologies/javase-downloads.html 下载 JDK 11 最新版本（JDK 8 也可以，但是要求最新版本，也就是说 Ubuntu 20.04 所提供的版本不够高），找到 JDK 11 ，下载 DEB 包文件，假设下载的 DEB 包是 jdk-11.0.8_linux-x64_bin.deb ，执行 `sudo dpkg -i jdk-11.0.8_linux-x64_bin.deb` ，然后把 `/usr/lib/jvm/jdk-11.0.8/bin/` 目录的绝对路径追加到系统用户的 PATH 路径中（export PATH="/path/to/jdk-11/bin:${PATH}"，并把它写进 ~/.bashrc 文件中）。
    - 在使用 Vim/NeoVim 打开任何 Java 文件之前（如果在进行此一步之前打开，那么要先卸载 coc-java 插件（ :CocUninstall coc-java ），然后重新安装此插件，然后进行这一步），到 http://mirrors.neusoft.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz 下载后端 jdt.ls ，把下载好的压缩包放到 `~/Downloads/` 目录，并就地解压缩，最后删除压缩包。
    - 配置：

        ```json
        "java.enabled": true,
        "java.home": "/usr/lib/jvm/jdk-11.0.10",
        "java.configuration.runtimes": [
            {
            "name": "JavaSE-11",
            "path": "/usr/lib/jvm/jdk-11.0.10"
            }
        ],
        "java.jdt.ls.home": "Your user home absolute path(include /home/username)/Downloads/jdt-language-server-latest"
        ```

        其中，路径 `/usr/lib/jvm/jdk-11.0.10` 指安装的 JDK 版本相对应的安装路径，前后时间安装的可能不同。

还有更多的东西移步： https://github.com/neoclide/coc-java

#### coc-jedi

1. coc.nvim 对于 Python 代码提示的插件，基于 jedi-language-server。
2. 安装：

    - 安装 jedi-language-server：

        ```text
        pip install -U jedi-language-server
        ```

        然后把路径 `${HOME}/.local/bin` 追加到系统环境变量中：

        ```text
        nano ~/.bashrc
        # 输入以下一行
        export PATH="${HOME}/.local/bin:${PATH}"
        # 然后保存退出
        # 使更新的 .bashrc 文件生效
        source ~/.bashrc
        ```

        参考： https://github.com/pappasam/jedi-language-server#user-content-installation

    - 安装 python3-venv ：

        ```text
        sudo apt-get install -y python3-venv
        ```

    - 安装 coc-jedi ： `:CocInstall coc-jedi`

3. 配置：

    ```text
    "jedi.enable": true,
    "jedi.startupMessage": "messages",
    "jedi.markupKindPreferred": "plaintext",
    "jedi.trace.server": true,
    "jedi.jediSettings.autoImportModules": [],
    "jedi.executable.command": "jedi-language-server",
    "jedi.executable.args": [],
    "jedi.completion.disableSnippets": false,
    "jedi.diagnostics.enable": true,
    "jedi.diagnostics.didOpen": true,
    "jedi.diagnostics.didChange": true,
    "jedi.diagnostics.didSave": true
    ```

具体配置请参阅： https://github.com/pappasam/coc-jedi

#### coc-json

1. coc.nvim 的 Json 语言服务端扩展。
2. 安装： :CocInstall coc-json
3. 配置：

    ```text
    "json.enable": true,
    "json.trace.server": "messages",
    "json.format.enable": true
    ```

具体配置请参阅： https://github.com/neoclide/coc-json

#### coc-phpactor

1. 把 CoC 与 Phpactor 集成起来的扩展。使用它之前需要安装 Phpactor。
2. 安装： :CocInstall coc-phpactor
3. 配置：

    ```text
    "phpactor.enable": true,
    "phpactor.path": "~/.vim/bundles/phpactor/bin/phpactor",
    "languageserver": {
        "phpactor": {
            "command": "phpactor",
            "args": ["language-server"],
            "trace.server": "verbose",
            "filetypes": ["php"]
        }
    }
    ```

了解更多请访问： https://github.com/phpactor/coc-phpactor

#### coc-sh

1. SH 语言使用 bash-language-server 作为服务端的 CoC 扩展。
2. 安装：

    - 安装 bash-language-server ：

        ```text
        sudo npm i -g bash-language-server
        ```

        参阅： https://github.com/bash-lsp/bash-language-server

    - 安装 coc-sh： :CocInstall coc-sh

3. 配置：

    ```text
    "sh.enable": true,
    "languageserver": {
        "bash": {
        "command": "bash-language-server",
        "args": ["start"],
        "filetypes": ["sh"],
        "ignoredRootPaths": ["~"]
        }
    }
    ```

了解更多请访问： https://github.com/josa42/coc-sh

#### coc-sql

1. coc.nvim 的 SQL 扩展。
2. 安装：

    - 安装 sql-formatter 和 node-sql-parser

        ```text
        sudo npm install -g sql-formatter
        sudo npm install node-sql-parser --save
        ```

    - 安装 coc-sql： `:CocInstall coc-sql`

3. 配置：

    将以下内容放进 `coc-extensions.conf.vim` 文件中：

    ```text
    xmap <leader>F  <Plug>(coc-format-selected)
    nmap <leader>F  <Plug>(coc-format-selected)
    ```

了解更多请访问： https://github.com/fannheyward/coc-sql

#### coc-tsserver

1. coc.nvim 的 Javascript 与 TypeScript 语言服务端。
2. 安装：

    - 安装 yarn （>= v2.0.0-rc.36）：

        ```text
        # 今天是 2020-09-01，yarn 版本尚未升级到 v2.0.0+
        sudo npm install -g yarn
        sudo yarn set version berry
        # 如果出现错误，可参照：https://www.chengxuzhilu.com/2398.html 的解决方案。
        ```

    - 安装 coc-tsserver ： :CocInstall coc-tsserver

3. 配置：

    ```text
    "tsserver.enable": true,
    "tsserver.locale": "",
    "tsserver.trace.server": "messages",
    "tsserver.npm": "/usr/local/bin/npm",
    "javascript.format.enabled": true,
    "javascript.showUnused": true,
    "javascript.updateImportsOnFileMove.enable": true
    ```

更多配置选项在： https://github.com/neoclide/coc-tsserver

#### coc-vimlsp

1. coc.nvim 的 Vim 语言后端。
2. 安装： :CocInstall coc-vimlsp
3. 配置：

    - 在 coc-extensions.conf.vim 文件中添加：

        ```text
        let g:markdown_fenced_languages = [
                \ 'vim',
                \ 'help'
                \]
        ```

    - 在 cos-settings.json 文件中追加：

        ```text
        "vimlsp.trace.server": "messages",
        "vimlsp.debug": false,
        "vimlsp.indexes.projectRootPatterns": [".git", "autoload", "plugin",".root"]
        ```

更多信息请访问： https://github.com/iamcco/coc-vimlsp

其他的 Cos 扩展列表在： https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

## 编译安装 YouCompleteMe

由于暂时还没有弄懂 Coc-nvim 的 Java 配置，那么就用 YCM 进行配置 Java 开发环境，在这种情况下，YCM 或许在编译时只需要加上 --java-completer ，而其他的语言就没有必要通过 YCM 配置自动补全功能，用 Coc-nvim 就行了。

### 准备

#### 安装 clangd 方法一（Ubuntu 18.04 也可以用，如果 Ubuntu 20.04 用此法，则需要修改下载网址以及本地目录路径中相应的 “ubuntu-18.04” 部分）

1. 由于目前 YCM 要求 clangd 的版本要大于等于 10.0,所以要在 LLVM 网站 (https://releases.llvm.org/download.html) 上下载最新的与操作系统对应的编译好的二进制打包文件(Pre-Built Binaries).这里是: Ubuntu 18.04,将其下载到 ~/Downloads 目录,然后解压:

    ```text
    # 可能下载速度很慢，如果想快些，那么请你另想办法，一定会有办法的。
    wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    tar Jxvf clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    ```

    得到 clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04 目录

2. 將上面解压到的 LLVM 目录下的 bin 目录加入系统环境变量中去,以使用其的 clang、clang++及 clangd 三个命令。

    ```text
    vim ~/.bashrc
    # 追加以下内容：
    export PATH="${HOME}/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin:${HOME}/.vim/bundles/phpactor/bin:${PATH}"
    # 保存退出
    # 使生效
    source ~/.bashrc
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd /usr/bin/
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang /usr/bin/
    sudo ln -sf ~/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang++ /usr/bin/
    # 如果执行以下命令
    whereis clangd
    ```

得到以下的结果：

```text
clangd: /usr/bin/clangd /home/username/Downloads/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clangd
```

#### 安装 Clangd 10 方法 二 （只能 Ubuntu 20.04 用）

```text
sudo apt-get install -y clang-10 clangd-10
whereis clangd-10
```

执行结果：

```text
clangd-10: /usr/bin/clangd-10 /usr/share/man/man1/clangd-10.1.gz
```

然后创建 clangd-10 和 clang-10 的软链接：

```text
sudo ln -sf /usr/bin/clang-10 /usr/bin/clang
sudo ln -sf /usr/bin/clangd-10 /usr/bin/clangd
sudo ln -sf /usr/bin/clang++-10 /usr/bin/clang++
```

那么 clangd 就部署好了。

### 编译 YouCompleteMe

1. 进入 ycm 的目录

    ```text
    cd ~/.vim/bundles/YouCompleteMe/
    ```

2. 执行 git 初始化任务

    ```text
    git submodule update --init --recursive
    ```

    如果以上命令执行时没有输出，则表示 YCM 所需的代码下载完成。

### 修改编译时必要组件的下载服务器（换成国内）

因为之前安装了 ag ，所以就用 ag 命令来搜索官方的域名，eclipse.org，然后将它替换为国内服务器，这样下载会快很多。

```text
ag "eclipse.org" .
```

查找结果：

```text
...
third_party/ycmd/build.py
975:  JDTLS_SERVER_URL_FORMAT = ( “http://download.eclipse.org/jdtls/snapshots/”
```

找的就是这个文件！然后，把 `http://download.eclipse.org/` 替换为 `http://mirrors.neusoft.edu.cn/eclipse/`。

### 开始编译 YCM

可以按需进行编译，例如：只想用 YCM 来补全 Java，那么就只需要在编译时加上 --java-completer 条件，如果需要 C/C++ 和 Java，就可以以 --clangd-completer --java-completer 作为条件进行编译。

执行以下命令进行编译：

```text
# 本条编译命令使 YCM 支持 JavaScript、TypeScript、C/C++ 和 Java
./install.py --js-completer --ts-completer --clangd-completer --java-completer
```

编译过程中出现一些错误而终止了编译：

```text
npm ERR! code EACCES
npm ERR! syscall mkdir
npm ERR! path /home/username/.npm/_cacache/index-v5/a9/0f
npm ERR! errno -13
npm ERR!
npm ERR! Your cache folder contains root-owned files, due to a bug in
npm ERR! previous versions of npm which has since been addressed.
npm ERR!
npm ERR! To permanently fix this problem, please run:
npm ERR!   sudo chown -R 1000:1000 "/home/username/.npm"

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/username/.npm/_logs/2020-06-01T07_27_26_302Z-debug.log
```

解决此问题的方法是执行：

```text
sudo chown -R 1000:1000 /home/username/.npm
```

再次用同样的参数进行编译。

如果遇到：

```text
Done installing Clangd
Clangd completer enabled. If you are using .ycm_extra_conf.py files, make sure they use Settings() instead of the old and deprecated FlagsForFile().
```

那么就表示编译成功！

由于 Coc-nvim 插件也可以作为 C/C++、JS、TS 代码提示的前端，因此以下命令也可不加上编译条件 --js-completer --ts-completer --clangd-completer。

如果只需要 Java 的代码补全：

```text
./install.py --java-completer
```

关于 YCM 的配置可参考本人的 Vim 配置文件 ycm-config.vim 。

另，如果没有仓库中那三个 ycm_extra_conf.py 文件，则 YCM 会变成没有用的废物。

注意：如果不想 YCM 支持的编程语言（文件后缀）与其他（例如： Coc-nvim）代码补全插件想冲突，那么请在 ycm-config.vim 文件中的 g:ycm_filetype_blacklist 变量中声明出来。或者想要支持某种编程语言，就请将它从黑名单中移除。然后保存文件并退出，同时要在别的补全插件中对该编程语言禁用，不然易出问题。在下一次打开文件时生效。

YouCompleteMe 的官方仓库是：https://github.com/ycm-core/YouCompleteMe

YCM 的配置详细信息：　https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide

## 创建 undodir 目录(用于通过插件来保存文件修改记录)

```text
mkdir ~/.vim/undodir
```

## 结语

本人的 Vim 配置就此配置完成，工作平台是 Ubuntu 20.04 for WSL 2，在 Ubuntu 18.04 LTS Desktop 也是可以的。其他操作系统上尚未尝试过，若你需要在其他操作系统上配置，那么就要参考网络上的资料。

## 更新历史（从 2021-03-05 起）

Update: 2021-03-05 增加 NeoVim 的安装和配置

Update: 2021-03-09 增加关于 NodeJs 升级的描述

Created On: 2020-06-01

Updated On: 2021-03-09

鉴于本人的相关知识储备以及能力有限，本博客的观点和描述如有错漏或是有考虑不周到的地方还请多多包涵，也欢迎指正，一起学习，共同进步。
