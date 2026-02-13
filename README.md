# Rho LaTeX Template Suite

**Rho 学术 LaTeX 模板套件**

[English](#english) | [中文](#中文说明)

---

<a name="english"></a>

## English Guide

### Overview

Rho is a professional LaTeX template suite for academic writing, covering **four** document types commonly used in the publication workflow:

| Template | File | Class | Purpose |
|----------|------|-------|---------|
| **Main Paper** | `Main.tex` | `class/main.cls` | Two-column academic paper |
| **Supplementary** | `Supplementary.tex` | `class/sup.cls` | Single-column supplementary material |
| **Cover Letter** | `Cover_Letter.tex` | `class/cover_letter.cls` | Submission cover letter |
| **Response to Reviewers** | `Response.tex` | `class/response.cls` | Point-by-point reviewer response |

### File Structure

```
Latex-Template/
├── Main.tex                  # Main paper (entry point)
├── Supplementary.tex         # Supplementary material
├── Cover_Letter.tex          # Cover letter
├── Response.tex              # Response to reviewers
├── ref.bib                   # Bibliography database
├── abstract_graph.pdf        # Graphical abstract example
├── figure/                   # Figures directory
├── class/                    # Class files (do NOT modify)
│   ├── main.cls              # Main paper class
│   ├── sup.cls               # Supplementary class
│   ├── cover_letter.cls      # Cover letter class
│   ├── response.cls          # Response class
│   ├── rhoenvs.sty           # Shared environments
│   ├── rhobabel.sty          # Language support
│   └── cover.cls             # Alias for cover_letter.cls
└── README.md
```

### Quick Start

#### 1. Compilation

All templates require **XeLaTeX**. For documents with bibliography (Main, Supplementary), use:

```bash
xelatex Main
biber Main
xelatex Main
xelatex Main
```

For Cover Letter and Response (no bibliography), single compilation suffices:

```bash
xelatex Cover_Letter
xelatex Response        # Run twice for TOC
```

#### 2. Theme Colors

All templates support three built-in theme colors via `\rhotheme{color}`:

| Color | Command | Hex |
|-------|---------|-----|
| Red (default) | `\rhotheme{red}` | `#B00000` |
| Purple | `\rhotheme{purple}` | `#6A1B9A` |
| Blue | `\rhotheme{blue}` | `#1565C0` |

#### 3. VS Code Configuration (LaTeX Workshop)

Add these **magic comments** at the top of your `.tex` file:

```latex
%!TEX program = xelatex
%!BIB program = biber
```

Or configure `settings.json`:

```json
"latex-workshop.latex.recipes": [
    {
        "name": "XeLaTeX -> Biber -> XeLaTeX x2",
        "tools": ["xelatex", "biber", "xelatex", "xelatex"]
    }
],
"latex-workshop.latex.tools": [
    {
        "name": "xelatex",
        "command": "xelatex",
        "args": ["-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"]
    },
    {
        "name": "biber",
        "command": "biber",
        "args": ["%DOCFILE%"]
    }
]
```

---

### Template Details

#### Main Paper (`Main.tex`)

Full-featured two-column academic paper template.

**Key commands:**

```latex
\documentclass[10pt,a4paper,twoside,onecolumn]{class/main}
\rhotheme{red}

\title{Your Paper Title}
\author[1]{Author One}
\author[2]{Author Two}
\affil[1]{University A}
\affil[2]{University B}
\corres{Corresponding Author}
\email{email@example.com}
\leadauthor{Author One et al.}
\institution{University Name}

\setbool{rho-abstract}{true}
\setbool{corres-info}{true}

\begin{abstract}
    Your abstract here.
\end{abstract}
\keywords{keyword1, keyword2}
```

**Features:** Abstract, graphical abstract (`\graphicalabstract`), running headers, BibLaTeX references, ORCID links, correspondence info, figure/table numbering.

---

#### Supplementary Material (`Supplementary.tex`)

Single-column template for supplementary data, proofs, and extended results.

**Key commands:**

```latex
\documentclass[10pt,a4paper,onecolumn]{class/sup}
\title{Supplementary Material: ...}
\author{Author list}
\dates{\today}
\paperversion{Version -- \today}
\setupxr{Main}               % Cross-reference Main.tex
```

**Features:** Table of contents, cross-document references (`\setupxr`), S-prefix numbering for figures/tables can be configured manually, version info in footer.

---

#### Cover Letter (`Cover_Letter.tex`)

Clean, professional cover letter for journal submission.

**Key commands:**

```latex
\documentclass{class/cover_letter}
\rhotheme{red}

% Paper info (defined once, auto-fills Subject line)
\papertitle{Your Paper Title}
\journalname{Target Journal}

% Sender
\sendername{Prof. Your Name}
\senderaffiliation{Department \\ University}
\senderaddress{City, Country}
\senderemail{your@email.com}

% Recipient
\recipientname{Dr. Editor Name}
\recipienttitle{Editor-in-Chief}

% Letter content
\opening{Dear Dr. Editor,}
\closing{Sincerely,}
```

**Usage pattern:**

```latex
\begin{document}
\makeheader
% ... letter body ...
% Use \thepapertitle and \thejournalname to reference paper/journal
\makeclosing
\end{document}
```

**Features:** Auto-generated subject line from `\papertitle` + `\journalname`, institution logo support (`\institutionlogo{path}`), consistent header/footer.

---

#### Response to Reviewers (`Response.tex`)

Structured point-by-point response template with Table of Contents navigation.

**Key commands:**

```latex
\documentclass{class/response}
\rhotheme{red}

\papertitle{Your Paper Title}
\journalname{Target Journal}
\authorname{Author et al.}
\manuscriptid{MS-2025-XXXXX}
```

**Core environments:**

| Environment | Purpose | Visual style |
|-------------|---------|-------------|
| `\reviewer{N}` | Section divider per reviewer | Black bold heading |
| `reviewercomment` | Reviewer's original comment | Blue text |
| `authorresponse` | Author's reply | Black text with bold "Response:" label |
| `revisedtext` | Quoted revised manuscript text | Green background box with embedded title |

**Markup commands:**

| Command | Effect | Usage |
|---------|--------|-------|
| `\added{text}` | Red italic (text) / Red (math) | Mark new content |
| `\addedtext{text}` | Red bold italic | Emphasized additions |
| `\deleted{text}` | Red strikethrough | Mark removed content |
| `\highlight{text}` | Yellow background | General highlight |

**Usage pattern:**

```latex
\begin{document}
\makeresponsetitle

% Summary letter to editors
Dear Editors and Reviewers: ...

\makeresponsetoc              % Auto-generated Table of Contents

\reviewer{1}                  % Creates "Reviewer #1" section

\begin{reviewercomment}
    The reviewer's question goes here...
\end{reviewercomment}

\begin{authorresponse}
    Our response with multiple paragraphs, lists, equations...

    \begin{revisedtext}
        The revised manuscript text with \added{new content marked in red}.
    \end{revisedtext}
\end{authorresponse}

\reviewer{2}                  % Next reviewer
% ... repeat pattern ...
\end{document}
```

**Features:** Auto-numbered comments (e.g., Comment 1.1, 1.2, 2.1), hyperlinked TOC, `\added` works in both text and math mode.

---

### FAQ

1. **References show `[?]`** → Ensure you use `biber` (not `bibtex`). See VS Code config above.
2. **Abstract error** → `\begin{abstract}...\end{abstract}` must be placed **before** `\begin{document}` in Main/Supplementary templates.
3. **Response TOC missing** → Compile **twice** (first pass generates TOC data, second renders it).
4. **Cover Letter subject blank** → Define `\papertitle` and `\journalname` before `\begin{document}`.

---

---

<a name="中文说明"></a>

## 中文说明

### 概述

Rho 是一套专业的学术 LaTeX 模板套件，覆盖论文投稿流程中最常用的 **四种文档类型**：

| 模板 | 文件 | 文档类 | 用途 |
|------|------|--------|------|
| **正文** | `Main.tex` | `class/main.cls` | 双栏学术论文 |
| **补充材料** | `Supplementary.tex` | `class/sup.cls` | 单栏补充材料 |
| **投稿信** | `Cover_Letter.tex` | `class/cover_letter.cls` | 投稿附信 |
| **审稿回复** | `Response.tex` | `class/response.cls` | 逐条回复审稿意见 |

### 文件结构

```
Latex-Template/
├── Main.tex                  # 正文（编辑入口）
├── Supplementary.tex         # 补充材料
├── Cover_Letter.tex          # 投稿信
├── Response.tex              # 审稿回复
├── ref.bib                   # 参考文献数据库
├── abstract_graph.pdf        # 图形化摘要示例
├── figure/                   # 图片目录
├── class/                    # 文档类文件（请勿修改）
│   ├── main.cls              # 正文文档类
│   ├── sup.cls               # 补充材料文档类
│   ├── cover_letter.cls      # 投稿信文档类
│   ├── response.cls          # 审稿回复文档类
│   ├── rhoenvs.sty           # 共享环境宏包
│   ├── rhobabel.sty          # 多语言支持
│   └── cover.cls             # cover_letter.cls 的别名
└── README.md
```

### 快速开始

#### 1. 编译方法

所有模板需使用 **XeLaTeX** 编译。含参考文献的文档（Main、Supplementary）：

```bash
xelatex Main
biber Main          # 注意：是 biber，不是 bibtex
xelatex Main
xelatex Main
```

投稿信和审稿回复（无参考文献）：

```bash
xelatex Cover_Letter          # 编译一次即可
xelatex Response              # 编译两次（生成目录）
```

#### 2. 主题色

所有模板统一支持三种主题色，通过 `\rhotheme{颜色}` 切换：

| 颜色 | 命令 | 色值 |
|------|------|------|
| 学术红（默认） | `\rhotheme{red}` | `#B00000` |
| 优雅紫 | `\rhotheme{purple}` | `#6A1B9A` |
| 经典蓝 | `\rhotheme{blue}` | `#1565C0` |

#### 3. VS Code 配置

在 `.tex` 文件顶部添加：

```latex
%!TEX program = xelatex
%!BIB program = biber
```

或在 `settings.json` 中配置编译配方（见英文部分 JSON 示例）。

---

### 各模板使用说明

#### 正文 (`Main.tex`)

全功能双栏论文模板，支持摘要、图文摘要、交叉引用等。

```latex
\documentclass[10pt,a4paper,twoside,onecolumn]{class/main}
\rhotheme{red}

\title{论文标题}
\author[1]{作者一}
\affil[1]{单位}
\corres{通讯作者}
\email{email@example.com}
\leadauthor{作者一 et al.}           % 页眉显示
\institution{单位名称}               % 页脚显示

\setbool{rho-abstract}{true}        % 开启摘要
\setbool{corres-info}{true}         % 开启通讯信息

\begin{abstract}
    摘要内容。
\end{abstract}
\keywords{关键词1, 关键词2}
```

---

#### 补充材料 (`Supplementary.tex`)

单栏排版,适合补充数据、推导、扩展实验等。

```latex
\documentclass[10pt,a4paper,onecolumn]{class/sup}
\title{Supplementary Material: ...}
\author{作者列表}
\setupxr{Main}                      % 交叉引用正文
```

使用 `\setupxr{Main}` 可以引用正文中的图表编号（需先编译 Main.tex）。

---

#### 投稿信 (`Cover_Letter.tex`)

设置论文信息后，Subject 行自动生成。

```latex
\documentclass{class/cover_letter}

\papertitle{论文标题}                % 定义一次，全局复用
\journalname{IEEE Trans. on XXX}   % 同上

\sendername{Prof. 张三}
\senderaffiliation{计算机系 \\ 某某大学}
\senderemail{zhangsan@example.com}

\recipientname{Dr. Editor}
\recipienttitle{Editor-in-Chief}
\opening{Dear Dr. Editor,}
\closing{Sincerely,}
```

正文中用 `\thepapertitle` 和 `\thejournalname` 引用论文标题和期刊名。

---

#### 审稿回复 (`Response.tex`)

**最核心的三个环境：**

```latex
\reviewer{1}                        % 创建 "Reviewer #1" 分区

\begin{reviewercomment}             % 审稿意见（蓝色文字）
    审稿人的问题...
\end{reviewercomment}

\begin{authorresponse}              % 作者回复（黑色，支持多段+列表）
    我们的回复...

    \begin{revisedtext}             % 正文修改段落（绿色背景框）
        修改后的正文，其中 \added{新增内容用红色斜体标记}。
    \end{revisedtext}
\end{authorresponse}
```

**修改标记命令：**

| 命令 | 效果 | 场景 |
|------|------|------|
| `\added{文字}` | 红色斜体 | 文本/公式中标记新增内容 |
| `\deleted{文字}` | 红色删除线 | 标记删除内容 |
| `\highlight{文字}` | 黄色背景 | 通用高亮 |

**完整流程：**

1. 设置论文信息 → `\makeresponsetitle`
2. 写致编辑总结信
3. `\makeresponsetoc` 生成目录
4. 用 `\reviewer{N}` 分区，逐条回复
5. 编译 **两次**（第一次生成目录数据）

---

### 常见问题

1. **参考文献显示 `[?]`** → 使用 `biber` 而非 `bibtex`，参见编译配置。
2. **摘要报错** → `\begin{abstract}...\end{abstract}` 必须在 `\begin{document}` **之前**。
3. **审稿回复目录为空** → 编译 **两次**。
4. **投稿信 Subject 为空** → 检查是否定义了 `\papertitle` 和 `\journalname`。
5. **Cover Letter 用 `\thejournalname`** → 返回期刊名斜体格式，适合在正文中引用。

---

### License

This template is provided as-is for academic use. Feel free to modify for your own projects.