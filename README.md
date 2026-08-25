# 学术 LaTeX 模板套件 | Academic LaTeX Template Suite

[中文](#中文说明) | [English](#english)

---

<a name="中文说明"></a>

## 中文说明

### 概述

这是一套面向**全流程学术写作与多出版社投稿**的高效模块化 LaTeX 模板工程。
* **开箱即用**：一级目录（根目录）默认预置以 **IEEE Transactions** 为标准的主论文（`Main.tex`）、投稿附信（`Cover_Letter.tex`）与审稿回复信（`Response.tex`），点开即可直接写作与编译；
* **极简切换**：在 `templates/` 下集成 **Elsevier (ESWA CAS 官方双栏)**、**IEEE Transactions / Conference**、**ACM SIGCONF** 以及 **自定义现代预印本** 标准模板；
* **参考文献智能宏解耦**：基于单一 `bib/refer.bib`，通过 `bib/journal_abrv.bib`（标准缩写字典）与 `bib/journal_full.bib`（官方全称字典），**无需改动文献数据，改一个参数即可在 IEEE 缩写 与 Elsevier/ACM 全称之间一键切换**；
* **高雅美化**：全局默认采用经典**学术墨绿色**（`#0B6623`）超链接与引用高亮；表格默认采用**自适应宽度 + 垂直水平全居中**；参考文献引入 `xurl` **任意字符智能换行**，彻底解决 URL / 表格溢出栏外的问题；
* **VS Code 极简视图**：配置了 `files.exclude`，自动过滤隐藏 `.aux`、`.blg`、`.bcf`、`.log` 等无用中间文件。

---

### 项目目录结构

```text
Latex-Template/
├── Main.tex                            # 【一级目录主入口】默认 IEEE Transactions 标准双栏
├── Cover_Letter.tex                    # 【一级目录】投稿附信
├── Response.tex                        # 【一级目录】审稿逐条回复信
├── compile.bat                         # 根目录一键自动化终端编译脚本
│
├── sections/                           # 【核心共享内容】（所有模板共享此目录）
│   ├── 01_introduction.tex             # 引言 (含真实文献引用)
│   ├── 02_related_work.tex             # 相关工作 (含真实文献引用)
│   ├── 03_method.tex                   # 方法与数学推导
│   ├── 04_experiments.tex              # 实验对比 (自适应居中表格)
│   └── 05_conclusion.tex               # 结论与未来展望
│
├── bib/                                # 【统一参考文献库与宏字典】
│   ├── refer.bib                       # 真实学术文献数据库 (唯一事实来源)
│   ├── journal_abrv.bib                # 【标准缩写字典】IEEE/ACM 期刊会议 ISO-4 缩写
│   └── journal_full.bib                # 【官方全称字典】Elsevier/ACM/毕业论文 官方全称
│
├── figures/                            # 【统一插图库】
│
├── templates/                          # 【多出版社独立模板包】
│   ├── 01_Custom_Preprint/             # 自定义现代学术预印本套件 (XeLaTeX + Biber)
│   ├── 02_IEEE_Transactions/           # IEEE Transactions / Journals 官方标准
│   ├── 03_IEEE_Conference/             # IEEE 旗舰会议官方标准 (INFOCOM, ICC 等)
│   ├── 04_Elsevier_ESWA/               # Elsevier CAS 双栏官方标准 (ESWA 实战模板)
│   └── 05_ACM_Conference/              # ACM SIG 会议与期刊官方标准 (KDD, SIGMOD 等)
│
├── packages/                           # 【底层依赖宏包与出版社类库】
│   ├── custom/                         # 自定义模板类 (main.cls, sup.cls, response.cls 等)
│   └── publishers/                     # 官方出版社类库 (ieee, elsevier_cas, acm)
│       └── compat_helper.sty           # 样式增强与居中表格、墨绿配色支持
│
└── .vscode/settings.json               # VS Code 自动构建与隐藏中间文件配置
```

---

### 参考文献全称与缩写切换指南

在 `bib/refer.bib` 中，期刊名与会议名使用抽象宏变量（如 `journal = J_SENSORS,`，`booktitle = C_WCNC,`）：

* **需要 IEEE 标准缩写时（如投 IEEE Trans/Conf）**：
  ```latex
  \bibliography{bib/journal_abrv,bib/refer}
  ```
  *渲染效果：`Sensors`，`IEEE Sensors J.`，`Proc. IEEE WCNC`*

* **需要官方完整全称时（如投 Elsevier / ACM / 毕业论文）**：
  ```latex
  \bibliography{bib/journal_full,bib/refer}
  ```
  *渲染效果：`IEEE Sensors Journal`，`Proceedings of the IEEE Wireless Communications and Networking Conference (WCNC)`*

---

### 快速开始与编译指南

#### 1. 命令行一键编译 (`compile.bat`)

在根目录下直接双击运行或在终端执行：
```cmd
compile.bat                     # 默认直接编译根目录 Main.tex (IEEE Trans)
compile.bat Cover_Letter        # 编译根目录投稿信
compile.bat Response            # 编译根目录审稿回复信
compile.bat 04_Elsevier_ESWA    # 单独编译 Elsevier ESWA 模板
compile.bat ALL                 # 一键编译根目录及全部出版社版本
```

#### 2. VS Code (LaTeX Workshop) 支持

在 VS Code 中直接打开任意 `.tex` 文件，按 `Ctrl+Alt+B` 即可自动执行对应编译配方。已在配置中隐藏 `.aux`, `.log`, `.blg`, `.bcf` 等文件，文件列表极简清爽。

---

<a name="english"></a>

## English Guide

### Overview

A streamlined LaTeX authoring repository supporting direct root compilation and effortless multi-publisher switching (IEEE, Elsevier ESWA CAS, ACM, and Custom Preprint) with academic green hyperlinks, wrapped URLs, vertically/horizontally centered auto-fitting tables, and centralized abbreviation/full-name bibliography aliasing.
