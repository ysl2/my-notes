# LaTeX

## 一份vscode snippets

> 原链接：https://zhuanlan.zhihu.com/p/150871057

<details>
<summary>snippet</summary>

```json
{
	// Place your snippets for latex here. Each snippet is defined under a snippet name and has a prefix, body and
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the
	// same ids are connected.
	// Example:
	// "Print to console": {
	// 	"prefix": "log",
	// 	"body": [
	// 		"console.log('$1');",
	// 		"$2"
	// 	],
	// 	"description": "Log output to console"
	// }
	"compile setting":{
		"prefix": "compile",
		"body": ["%!TEX program = ${1:xelatex} -> bibtex -> xelatex -> ${1:xelatex}"],
		"description": "set default the compile order"
	},
	"insert figure":{
		"prefix": "figure",
		"body":["\\begin{figure}[${1:htbp}]\n\t\\centering\n\t\\includegraphics[width=${2}]{${3}}\n\t\\caption{${4}}\n\t\\label{${5}}\n\\end{figure}"],
		"description": "insert figure snippet"
	},
	"insert table":{
		"prefix": "table",
		"body":["\\begin{table}[${1:htbp}]\n\t\\centering\n\t\\caption{${2:caption}}\n\t\t\\begin{tabular}{${3:c|c}}\n\t\t\\hline\n\t\t${4:column1 & column2}\n\t\t\\end{tabular}\n\t\\label{${5:label}}\n\\end{table}"],
		"description": "insert table snippet"
	},
	"insert enumerate":{
		"prefix": "enumerate",
		"body":["\\begin{enumerate}\n\t\\item ${1:enumerate1}\n\t\\item ${2:enumerate2}\n\\end{enumerate}"],
		"description": "insert enumerate snippet"
	},
	"insert item":{
		"prefix": "itemize",
		"body":["\\begin{itemize}\n\t\\item ${1:itemsize1}\n\t\\item ${2:itemsize2}\n\\end{itemize}"],
		"description": "insert item snippet"
	},

}
```

</details>

## 关键词

overleaf

## 网站

https://www.blurredcode.com/2020/08/linux下texlive环境配置指北/

www.latexlive.com
