# github三线部署的yml文件

```yml
name: Blog CI/CD

# 触发条件：在 push 到 hexo-blog-backup 分支后触发
on:
  push:
    branches:
      - hexo-blog-backup

env:
  TZ: Asia/Shanghai

jobs:
  blog-cicd:
    name: Hexo blog build & deploy
    runs-on: ubuntu-latest # 使用最新的 Ubuntu 系统作为编译部署的环境

    steps:
    - name: Checkout codes
      uses: actions/checkout@v2

    - name: Setup node
      # 设置 node.js 环境
      uses: actions/setup-node@v1
      with:
        node-version: '12.x'

    - name: Cache node modules
      # 设置包缓存目录，避免每次下载
      uses: actions/cache@v1
      with:
        path: ~/.npm
        key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}

    - name: Install hexo dependencies
      # 下载 hexo-cli 脚手架及相关安装包
      run: |
        npm install -g hexo-cli
        npm install

    - name: Generate files
      # 编译 markdown 文件
      run: |
        hexo clean
        hexo generate

    - name: Deploy hexo blog
      env:
        # Github 仓库
        GITHUB_REPO: github.com/yifanzheng/yifanzheng.github.io
        # Coding 仓库
        CODING_REPO: e.coding.net/yifanzheng/blogs.git
        # Gitee 仓库
        GITEE_REPO: gitee.com/yifanzheng/yifangzheng.gitee.io.git
      # 将编译后的博客文件推送到指定仓库
      run: |
        cd ./public && git init && git add .
        git config user.name "yifanzheng"
        git config user.email "zhengyifan1996@outlook.com"
        git add .
        git commit -m "GitHub Actions Auto Builder at $(date +'%Y-%m-%d %H:%M:%S')"
        git push --force --quiet "https://${{ secrets.ACCESS_TOKEN }}@$GITHUB_REPO" master:master
        git push --force --quiet "https://RoYFbFDSfM:${{ secrets.CODING_TOKEN }}@$CODING_REPO" master:master
        git push --force --quiet "https://yifanzheng:${{ secrets.GITEE_ACCESS_TOKEN }}@$GITEE_REPO" master:master
```
