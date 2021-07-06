# git子模块

> 子模块的本质：
>
> 主模块只能记录子模块的某一个commit，无法区分子模块究竟是哪一个分支。因为实际上分支最终也是固定在了某一个commit上。
>
> 因此子模块的版本迭代与主模块实际上没有关系。只是主模块能够检测到子模块commit有变化。至于究竟是怎么变的，主模块并不关心。
>
> 主模块的任务就是记下当前子模块处在的commit，仅此而已。
>
> 可以类比一下项目与npm包的关系。假设某个包已经更新到了v2.0，但我项目中指定就要v1.0。或者我指定就要v2.0。或者我指定就要v3.0（当然这样肯定会报错的:-)）。
>
> 为什么子模块有时会处在一个游离的HEAD指针中？这就是答案：主模块不关心子模块的分支，直接限定子模块到某一个commit中去。而子模块具体想在哪个分支，这是子模块自己的事。主模块不会管。这导致了主模块记录的指针与子模块的指针分离。我们此时需要做的就是将“主模块记录的commit”和“子模块当前的commit”统一。如果不统一指针，子模块中的数据很有可能在下一次提交的时候被放在了一个游离的commit中，而不是master分支上。这很容易造成数据丢失，是非常危险的。
>
> 因此考虑一个场景：如果子模块的本地版本比较超前，而子模块云端版本落后，那么此时如果主模块做了commit + push，会导致云端上主模块使用的子模块版本超前，而云端的子模块并没有这么超前。
>
> 实际上这就相当于“云端只有v2.0，但是我却指定了v3.0”的情况。
>
> 那么其他人如果再拉取主模块并同步它的子模块，云端上将找不到子模块对应的版本。
>
> 解决方法：要么把超前的子模块推到云端让主模块能够找到，要么回退主模块中记录的子模块的版本，把记录的子模块的指针回退到一个云端存在的版本，再做子模块同步。

## 添加子模块

```text
# 会自动从github上下载子模块到本地
git submodule add git@github.com:ysl2/sub.git
```

## 带子模块的项目拉取更新（git pull）

> 此部分不涉及本地更改文件的情况，只是从上游拉取
>
> 对于涉及本地更高文件的情况，需要使用下一个标题的方法

1. 首次拉取

    > 推荐方式1。如果方式1忘记加参数了，再用方式2

    ```text
    # 方式1：在克隆时顺便拉取子模块
    git clone git@github.com:ysl2/main.git --recurse-submodules

    # 方式2：克隆后，单独再拉取子模块（用于上面忘记加最后参数的情况）
    git clone git@github.com:ysl2/main.git
    git submodule update --init --recursive
    ```

2. 后续更新（注意只是更新，本地之前不存在改动的情况）

    > 推荐方法3：在配置全局`.gitconfig`文件后直接在主仓库使用`git pull`

    ```text
    # 方法1：只更新子模块
    # 进入子仓库
    cd sub/
    # 更新所有子模块
    git submodule update --remote

    # 方法2：通过foreach对每个子模块都执行单引号内的命令
    git submodule foreach 'git submodule update'
    git push --recurse-submodules=on-demand

    # 方法3（推荐）：先更新主模块，然后通过主模块递归更新所有子模块
    cd main
    # 在配置了全局`.gitconfig`文件后，下面的这个`--resurse-submodules`将会被默认添加。
    # 在配置之后，直接`git pull`即可，会连带着子模块一起pull
    git pull --recurse-submodules
    ```

3. 若子模块的URL发生了更改，则需要重新`sync`子模块的URL

    ```text
    # 将新的URL复制到本地配置中
    git submodule sync --recursive
    # 从新的URL更新子模块
    git submodule update --init --recursive
    ```

## 修改后提交子模块代码（git add/commit/push）

> 注意：
>
> 对主模块进行(add + commit + push)，不会对子模块产生影响。主要原因是push虽然有--recurse-submodules选项，但是还有子选项。比如：
>
> ```text
> git push --recurse-submodules=on-demand
> git push --recurse-submodules=check
> git push --recurse-submodules=...
> ```
>
> 然而就算git push有子选项也没用。因为git add和git commit没有子仓库的选项，还是需要先（add + commit）子仓库，再（add + commit + push）主仓库
> 详情见方法4（推荐方法4：先子模块批量(add + commit)，然后主模块(add + commit + push)）

### 方法1：单独提交子模块（不推荐）

1. 修改子模块，提交子模块

    ```text
    cd sub/
    git pull --rebase
    git add . && git commit && git push
    ```

2. 提交主模块

    ```text
    cd main
    git pull --rebase
    git add. && git commit && git push
    ```

### 方法2：批量提交子模块，最后提交主模块

1. 批量提交子模块（这一步必须要做，用于确定子模块上游是否有更新）

    ```text
    # 通过foreach对每个子模块都执行单引号内的命令
    cd main
    git submodule foreach 'git add . && git commit -am "$(date +"%Y-%m-%d %H:%M:%S")" && git push origin master'
    # 此时注意看控制台输出，观察某个子模块是否存在冲突需要merge
    ```

2. 提交主模块（在确定好子模块的版本后，再确定主模块的版本）

    ```text
    git add . && git commit -am "$(date +"%Y-%m-%d %H:%M:%S") && git push origin master
    ```

### 方法3：先pull，然后批量提交子模块（可以处理冲突。实际上这种方法和方法2是一样的）

1. 批量：pull子模块，然后尝试push（此过程有可能失败。因为可能产生冲突）

    ```text
    git submodule foreach 'git pull && git add . && git commit -am "$(date +"%Y-%m-%d %H:%M:%S")" && git push origin master'
    ```

2. 提交主模块

    ```text
    git pull && git add . && git commit -m "$(date +"%Y-%m-%d %H:%M:%S")" && git push origin master
    ```

### 方法4（推荐）：先子仓库批量（add + commit），然后主仓库（add + commit + push）

> 主仓库的push会顺便把子仓库push（但是注意这是在配置了全局的`.gitconfig`文件才行。默认是不会push子仓库的）
>
> 配置方法如下：
>
> ```text
> [push]
>       recurseSubmodules = on-demand
> ```

1. 子模块批量add + commit

    ```text
    git submodule foreach 'git add . && git commit -am "$(date +"%Y-%m-%d %H:%M:%S")"'
    ```

2. 主模块add + commit + push

    ```text
    git add . && git commit -am "$(date +"%Y-%m-%d %H:%M:%S")" && git push origin master
    ```

## 删除子模块

### 方式1：子模块已经存在（指子模块已经被pull下来了，子模块中存在文件）

```bash
# 进入主模块
cd main

# 取消子模块注册
git submodule deinit test-sub

# 在git中删除子模块
git rm -rf sub

# 删除储藏室中对应的子模块
cd .git/modules/
rm -rf sub

# 回到主模块并提交
cd ../../
git commit -am "$(date +"%Y-%m-%d %H:%M:%S")"
git push origin master

# （可选）在本地删除历史commit中所有与子模块相关的内容
# 注意，只是本地删除，因此不会产生change，也不会对远程产生影响
git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch path/to/folder/or/file' --prune-empty --tag-name-filter cat -- --all
```

### 方式2：子模块还没有被pull，子模块文件夹中是空的

1. 方案1：如果方案1正常执行，就不用执行方案2了

    ```text
    # 进入主模块
    cd main

    # 取消子模块注册
    # 如果此时报错，就不要继续执行了，采用下面那一种方案
    # 否则，在执行完方案1就不用执行方案2了
    git submodule deinit test-sub

    # 在git中删除子模块
    git rm --cached sub

    # 删除对应的子模块
    rm -rf sub

    # 删除配置项中子模块相关条目
    vi .git/config

    # 提交主模块
    git commit -am "$(date +"%Y-%m-%d %H:%M:%S")"
    git push origin master

    # （可选）在本地删除历史commit中所有与子模块相关的内容
    # 注意，只是本地删除，因此不会产生change，也不会对远程产生影响
    git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch path/to/folder/or/file' --prune-empty --tag-name-filter cat -- --all
    ```

2. 方案2：此方案用于上述方案执行出现错误的情况

    ```text
    # 进入主模块
    cd main

    # 在git中取消子模块追踪
    git rm sub

    # 编辑`.gitmodules`文件，把想要删的子模块相关内容删除
    nvim .gitmodules

    # 删除配置项中子模块相关条目
    nvim .git/config

    # 提交主模块
    git commit -am "$(date +"%Y-%m-%d %H:%M:%S")"
    git push origin master

    # （可选）在本地删除历史commit中所有与子模块相关的内容
    # 注意，只是本地删除，因此不会产生change，也不会对远程产生影响
    git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch path/to/folder/or/file' --prune-empty --tag-name-filter cat -- --all
    ```

---

## 拉取submodule注意事项

> 补充：如果在全局`.gitconfig`中配置了以下内容，那么是可以影响到子模块的。每次pull都会默认自动加上`--resurse-submodules`选项
>
> ```text
> [submodule]
>     recurse = true
> ```

主模块的`git pull`不会影响子模块。在`git pull`之后，如果发现子模块有修改，应立即执行

```text
git submodule update
```

但是上述命令需要对于每层子仓库都执行。如果嵌套的子模块层数过多，可以使用

```text
git submodule foreach git submodule update
```

## 修改submodule注意事项

在执行`git submodule update`之后，分支指针是游离的。必须手动切换到master

如果忘记了手动切换，可以通过`cherry-pick`挽救

1. 用 `git checkout master` 将 HEAD 从游离状态切换到 master 分支 , 这时候，git 会报 Warning 说有一个提交没有在 branch 上，记住这个提交的 change-id（假如 change-id 为 aaaa)
2. 用 `git cherry-pick aaaa` 来将刚刚的提交作用在 master 分支上
3. 用 `git push` 将更新提交到远程版本库中

以下是相关命令的操作示范和命令行输出结果：

```text
➜ ui_common git:(df697f9) git checkout master
Warning: you are leaving 1 commit behind, not connected to
any of your branches:

  df697f9 forget to check out master

If you want to keep them by creating a new branch, this may be a good time
to do so with:

 git branch new_branch_name df697f911e5a0f09d883f8f360977e470c53d81e

Switched to branch 'master'
➜ ui_common git:(master) git cherry-pick df697f9
```
