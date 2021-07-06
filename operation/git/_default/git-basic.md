# git基础

## git配置文件在linux中的位置

```text
git配置文件有三个位置:

1. /etc/gitconfig 系统配置文件，对应git config --system

2. ~/.gitconfig 用户全局配置文件，对应git config --global

3. 项目目录中.git/config 仅该项目配置文件，对应git config --local
```

## git取消某文件（或文件夹）的追踪

1. 取消追踪，但是`.git`文件夹中仍然存在此文件的历史

    ```text
    git rm --catched path/to/folder/or/file
    ```

2. 取消追踪，并且删掉以前的分支中曾存在的此文件的历史（更彻底）

    > 使用场景：出现报错`fatal: pathspec 'program-language/java/java-road' did not match any files`
    >
    > 参考：https://stackoverflow.com/questions/25458306/git-rm-fatal-pathspec-did-not-match-any-files

    ```text
    git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch path/to/folder/or/file' --prune-empty --tag-name-filter cat -- --all
    ```
