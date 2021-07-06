# markdown-basic

1.  块引用（此链接无法通过 Markdown-Link-Updater 自动更新）

    标题中不能有括号

    ```markdown
    [test](vim-and-neovim.md#多文档编辑)
    ```

    [test](../ide/vim-and-neovim/_default/vim-and-neovim.md#%E5%A4%9A%E6%96%87%E6%A1%A3%E7%BC%96%E8%BE%91)

2.  [折叠段落](https://www.zhihu.com/question/342335042/answer/803129565)

    ```html
    <details>
        <summary>Title</summary>

        content!!!
    </details>
    ```

    For example：

    <details>
    <summary>Title</summary>
    <table border="1">
    <tr>
    <th>参数</th>
    <th>含义</th>
    </tr>
    <tr>
    <td><code>start</code></td>
    <td>row 1, cell 2</td>
    </tr>
    <tr>
    <td>row 2, cell 1</td>
    <td>row 2, cell 2</td>
    </tr>
    </table>
    </details>

3.  行间代码

    ```html
    <pre>
    sudo pacman -Syyu
    print
    </pre>
    ```

4.  列表

    要在保留列表连续性的同时在列表中添加另一种元素，请将该元素缩进四个空格或一个制表符

5.  ~~删除线~~

6.  <u>下划线</u>

7.  流程图

    -   [mermaid](https://github.com/mermaid-js/mermaid)
    -   graphviz
    -   draw.io
    -   plantUML
    -   asciiflow

8.  图床

    -   https://ipic.ca/
    -   [我的知乎笔记 picgo](https://zhuanlan.zhihu.com/p/133856067)

9.  格式转换

    -   [md2all](http://md.aclickall.com/)
    -   pandoc

10. 所见所得的 vscode 扩展

    -   zaaack.markdown-editor
