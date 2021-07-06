# 镜像站

> 使用镜像站之前，最好把自己的`/etc/hosts`文件改一下，防止DNS污染
>
> 改DNS参考：https://zhuanlan.zhihu.com/p/107691233
>
> 查ip地址：https://www.ipaddress.com/

## HTTPS加速（也可用于curl或wget的单文件下载）

```text
# 可以直接采用`git clone https://github.com.cnpmjs.org/{用户名}/{仓库名}`的格式
https://github.com.cnpmjs.org

# 同样也可以直接采用`git clone https://hub.fastgit.org/{用户名}/{仓库名}`的格式
https://hub.fastgit.org

# 使用jsdelivr进行单文件加速
# 举个例子：
# 原始url
# https://github.com/{用户名}/{仓库名}/blob/master/{文件名}
# 转换结果
# https://cdn.jsdelivr.net/gh/{用户名}/{仓库名}/{文件名}
https://www.jsdelivr.com/

# 收费服务，但是也可以免费用，只是下载速度会限制在1 ～ 2m （收费的最高下载速度可以达到10m）
https://www.gitclone.com

# 码云的官方镜像库，每天同步一次
https://gitee.com/mirrors

# 清华大学开源镜像站
# 举个例子（安装brew）：git clone git://mirrors.ustc.edu.cn/homebrew-core.git
https://mirrors.tuna.tsinghua.edu.cn

http://gitd.cc

# 一个软件
https://blog.csdn.net/xiao073/article/details/109806489
```

## SSH加速

```text
# 输入 Github 仓库地址，使用生成的地址进行 git ssh 等操作
https://github.zhlh6.cn
```

## RELEASE、ARCHIVE、项目文件等加速

利用 Cloudflare Workers 对 github release 、archive 以及项目文件进行加速，部署无需服务器且自带 CDN.

```text
# 直接在copy出来的url前加https://gh.api.99988866.xyz/即可
https://gh.api.99988866.xyz

https://ghproxy.com/

https://g.ioiox.com

http://toolwa.com/github/

https://gh.con.sh

https://github.com/XIU2

https://pd.zwc365.com
```

## GITHUB-RAW加速

```text
# 将 `raw.githubusercontent.com` 替换为 `raw.sevencdn.com` 即可加速。
# 参考：https://7ed.net/gra/
http://raw.servencdn.com

# 上面提到的`ghproxy`这个网站也支持raw加速，见网站详情页：
https://ghproxy.com/

# jsdelivr也可以用于RAW加速
# jsdelivr 唯一美中不足的就是它不能获取 `exe` 文件以及 `Release` 处附加的 `exe` 和 `dmg` 文件。
# 也就是说如果 `exe` 文件是附加在 `Release` 处但是没有在 `code` 里面的话是无法获取的。所以只能当作静态文件 `cdn` 用途，而不能作为 `Release` 加速下载的用途。
https://www.jsdelivr.com/

https://raw.fastgit.org
```

## 附件

chrome的`github加速`插件
