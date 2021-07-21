# My Notes

<div align="center">
<img src="https://latex.codecogs.com/svg.image?\int_{a}^{b}&space;x^2&space;dx" title="\int_{a}^{b} x^2 dx" />
</div>

## 笔记在线浏览地址

https://notes.orangex4.cool/?git=github&github=ysl2/my-notes

## 克隆到本地

```text
git clone https://hub.fastgit.org/ysl2/my-notes.git --recurse-submodules
```

## 本仓库的特点

目前 obsidian 和 foam 都存在 bug，而又有各自的特点

因此我将二者合并

本文件夹既可通过 vscode 打开，也可通过 obsidian 打开

obsidian 用于追溯反向链接，vscode 用于创作和正向链接文章

为了保证笔记的通用性，所有链接都采用标准 markdown 链接

## 关于仓库结构的说明

1. 当需要重命名一个笔记的文件名的时候，必须同时改变同级目录下的`assets`文件夹中的同名文件夹名称

    比如：有一篇笔记`/article/note1.md`，现在需要重命名为`/article/note2.md`，那么必须同时更改`/article/assets/note1/`为`/article/assets/note2/`

    而当重命名一个普通文件夹的时候，可以直接修改，不需要同时修改其他文件

    这是因为`assets/同名文件夹`是相应的图床文件夹，如果不同时修改，下次粘贴新图片的时候会创建一个新笔记名称的文件夹，这样会导致一个笔记内的图片会被分到两个文件夹中

2. 当需要删除图片链接的时候，先定位到图片并删除，然后再删除图片链接

    如果先删除链接，再删除图片，很容易造成链接删除之后，忘记删图片。这样会造成无意义的图片数量变多，不利于后期维护

3. 当需要转移一个图片链接到另一篇文章的时候，一定注意把相应的图片也转移走

## 一些有趣的小玩意

https://iyideng.me/
