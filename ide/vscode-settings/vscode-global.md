# vscode 的全局注意事项

## lint

快捷键`ctrl + space`，按下两次可以展现二级 lint

## vscode 快捷键

### 下面这个表格有问题，需要重新弄，仅作为参考

| item                           | key                            | vscode-vim             |
| ------------------------------ | :----------------------------- | :--------------------- |
| vscode-vim                     | Check the global`setting.json` |                        |
| <s>Breadcrumb open</s>         | <s>`ctrl + shift + j`</s>      |                        |
| <s>Breadcrumb jump to l/r</s>  | <s>`ctrl + h/l`</s>            |                        |
| split current to right         | `<C-w> + v`                    | `:vsp`                 |
| split current below            | `<C-w> + s`                    | `:sp`                  |
| open global `setting.json`     | `alt + shift + m`              | `<leader> + M`         |
| open shortcuts                 | `alt + shift + s`              | `<leader> + S`         |
| toggle panel                   | `ctrl + alt + shift + p`       | `<C-w> + p`            |
| focus panel                    | `ctrl + alt + shift + o`       |                        |
| close notifications            | `ctrl + alt + shift + [`       |                        |
| focus editor                   | `ctrl + alt + shift + i`       |                        |
| closeEditorsInOtherGroups      |                                | `<C-w> + o` or `:only` |
| close all                      | `ctrl + alt + shift + a`       | `:qa`                  |
| move current editor to l/d/u/r | `<C-w> + H/J/K/L`              | `<C-w> + H/J/K/L`      |
| look between group l/d/u/r     | `<C-w> + h/j/k/l`              | `<C-w> + h/j/k/l`      |
| look between editor l/r        | `ctrl + alt + h/l`             | `gt` and `gT`          |
| search file by filename        | `ctrl + p`                     |                        |

### 需要添加的

> 全部弄成两套快捷键，vscode 原生和 vim 插件，让这两套快捷键统一
>
> 为了统一，必须针对每一类都设置一个前置键

1. 窗口：聚焦/切换（全部换成<C-w>开头）

    |                           |                | current                         | notice                                                               |
    | :------------------------ | :------------- | :------------------------------ | :------------------------------------------------------------------- |
    | focus to                  | `<C-w> + hjkl` | OK                              |                                                                      |
    | move to                   | `<C-w> + HJKL` | OK                              |                                                                      |
    | only editor/windows       | `<C-w> + o/O`  | different in system key binding | `:tabo` is also permitted                                            |
    | split vertical/horizontal | `<C-w> + v/s`  | different in system key binding | `:sp` and `:vsp` are also permitted                                  |
    | tab left/right            | `<C-w> + u/i`  |                                 | `gt` and `gT` are also permitted                                     |
    | ---                       | ---            | ---                             | ---                                                                  |
    | close notifications       | `<C-w> + n`    |                                 |                                                                      |
    | panel toggle/focus        | `<C-w> + p/P`  |                                 |                                                                      |
    | panel checkout/checkin    | `<C-w> + k/j`  |                                 | when both editor and panel is opened, this can navigate conveniently |
    | focus editor              | `<C-w> + e`    |                                 |                                                                      |
    | close all                 | `<C-w> + a`    |                                 | `:qa` is also permitted                                              |
    | close a tab               | `<C-w> + x`    |                                 | `:wq` or `:q` or `:q!` is also permitted                             |
    | ---                       | ---            | ---                             | ---                                                                  |
    | key-setting item/json     | `<C-w> + b/B`  |                                 |                                                                      |
    | setting-setting item/json | `<C-w> + m/M`  |                                 |                                                                      |

1. 代码：编辑/运行/调试（`<C-w>`开头或`<leader>`开头）

    |                                     |                                   | current | notice                                               |
    | :---------------------------------- | :-------------------------------- | :------ | :--------------------------------------------------- |
    | format code                         | `<leader> + f`                    | OK      | `command palette: format document` is also permitted |
    | quickfix                            | `<leader> + F`                    | OK      |                                                      |
    | add/remove debug points             | `<leader> + d/D`                  | OK      | do not add system key binding                        |
    | run/stop debug (notice code-runner) | `<C-w> + r/R` or `<leader> + r/R` |         | for `focus editor` and `not focus editor`            |
    | debug: step over/into/out           | `<leader> + o/i/I`                |         |

1. 系统：侧边栏/任务（`ctrl`开头或`ctrl + shift`开头）

    |                 |                              | current | notice |
    | :-------------- | :--------------------------- | :------ | :----- |
    | command palette | `ctrl + shift + p`           | OK      |        |
    | file element    | `ctrl + shift + o`           | OK      |        |
    | close sidebar   | `ctrl + shift + b`           | OK      |        |
    | file list       | `ctrl + shift + e`           | OK      |        |
    | global search   | `ctrl + shift + f`           | OK      |        |
    | extension       | `ctrl + shift + x`           | OK      |        |
    | git             | `ctrl + shift + g + g`       | OK      |        |
    | group exchange  | `ctrl + 1`, `ctrl + 2`, etc. | OK      |        |
    | terminal        | `` ctrl + ` ``               | OK      |        |
    | output          | `ctrl + shift + u`           | OK      |        |
    | shutdown        | `ctrl + shift + alt + w`     | OK      |        |

1. 文件列表：ranger 操作

    |                      |                                 | current | notice                   |
    | :------------------- | :------------------------------ | :------ | :----------------------- |
    | move                 | `vim: h/j/k/l g GG <C-d> <C-u>` | OK      |                          |
    | collapse             | `ctrl + h`                      | OK      |                          |
    | touch                | `T`                             | OK      |                          |
    | mkdir                | `M`                             | OK      |                          |
    | copy (name)          | `NULL`                          | OK      | this can't be a command. |
    | rename               | `a`                             | OK      |                          |
    | copy (file)          | `y y`                           | OK      |                          |
    | copy (relative path) | `y p`                           | OK      |                          |
    | copy (absolute path) | `y P`                           | OK      |                          |
    | cut                  | `d d`                           | OK      |                          |
    | pase                 | `p p`                           | OK      |                          |
    | delete               | `d D`                           | OK      |                          |
    | select (hover)       | `shift + space`                 | OK      |                          |
    | select (multiple)    | `space`                         | OK      |                          |
    | select (move)        | `shift + j/k`                   | OK      |                          |
    | select (into)        | `vim: l`                        | OK      |                          |

## vsode remote 图形转发

https://blog.csdn.net/Dteam_f/article/details/109806294
