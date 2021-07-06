# python包配置

## virtualenv & virtualenvwrapper

1. virtualenv在安装的时候最好使用sudo。不要使用普通用户

    ```bash
    sudo pip3 install virtualenv
    ```

2. virtualenvwrapper

    > 官方文档：https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html
    > 其他文档：https://www.cnblogs.com/pyyu/p/9015317.html

    如果PATH中没有特定的环境变量，则需要手动添加到zshrc里

    ```bash
    sudo pip3 install virtualenvwrapper
    vim ~/.bashrc
    # 写入以下三行代码
    # YuSoLi: 注意路径不一定是下面这个。需要自己找找
    export WORKON_HOME=~/Envs   #设置virtualenv的统一管理目录
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'   #添加virtualenvwrapper的参数，生成干净隔绝的环境
    export VIRTUALENVWRAPPER_PYTHON=/opt/python347/bin/python3     #指定python解释器
    source /opt/python34/bin/virtualenvwrapper.sh #执行virtualenvwrapper安装脚本
    # 读取文件，使得生效，此时已经可以使用virtalenvwrapper
    source ~/.bashrc
    ```
