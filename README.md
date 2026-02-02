# Rho Class Academic Article Template
# Rho 类学术论文模版 (9pt Optimized)

[English](#english) | [中文](#chinese)

---

<a name="english"></a>
## English Guide

### 1. Overview
This is a professional LaTeX template based on the **Rho Class**, optimized for high-density academic papers.
- **Base Font**: 9pt (Standard for many IEEE/Nature-like journals).
- **Layout**: 
    - `main-sample.tex`: Two-column layout for the main paper.
    - `sup-sample.tex`: Single-column layout for supplementary materials (with wide margins for S.x numbering).
- **Backend**: Uses `XeLaTeX` compiler and `biblatex` (with **biber** backend).

### 2. File Structure
*   **main.cls**: The primary class file for the main paper (9pt, Two-Column).
*   **sup.cls**: The class file for supplementary material (9pt, One-Column).
*   **main-sample.tex**: A ready-to-use example for your main paper.
*   **sup-sample.tex**: A ready-to-use example for supplementary material.
*   **ref.bib**: The bibliography database.
*   **rhoenvs.sty / rhobabel.sty**: Helper style packages.

### 3. How to Compile (Important!)
This template uses **BibLaTeX**, which requires **Biber** to process references. Standard BibTeX will **NOT** work.

**Standard Command Sequence:**
```bash
xelatex main-sample
biber main-sample
xelatex main-sample
xelatex main-sample
```

### 4. VS Code Configuration (LaTeX Workshop)
If your references are not showing up (showing `[?]` or bold citation keys), it is likely because VS Code is using `bibtex` instead of `biber`.

**How to configure Biber in VS Code:**

1.  Open VS Code Settings (`Ctrl + ,` or `Cmd + ,`).
2.  Search for `latex-workshop.latex.tools`.
3.  Click "Edit in settings.json".
4.  Add or Modify the `latexmk` tool to force it to run. The most robust way is to define a custom toolchain.
5.  **Recommended**: Just add these **Magic Comments** at the very top of your `.tex` file (Standard Practice):
    ```latex
    %!TEX program = xelatex
    %!BIB program = biber
    ```
6.  **Alternative: VS Code Settings (`settings.json`)**
    Copy this configuration to ensure `latexmk` uses `xelatex` and correctly detects `biber`.

    ```json
    "latex-workshop.latex.tools": [
        {
            "name": "latexmk",
            "command": "latexmk",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-pdf",
                "-outdir=%OUTDIR%",
                "%DOC%"
            ],
            "env": {}
        },
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ],
            "env": {}
        },
        {
            "name": "biber",
            "command": "biber",
            "args": [
                "%DOCFILE%"
            ],
            "env": {}
        }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "XeLaTeX -> Biber -> XeLaTeX x2",
            "tools": [
                "xelatex",
                "biber",
                "xelatex",
                "xelatex"
            ]
        }
    ]
    ```
    Then select the "XeLaTeX -> Biber -> XeLaTeX x2" recipe from the LaTeX Workshop sidebar.

---

<a name="chinese"></a>
## 中文说明 (Chinese Guide)

### 1. 简介
这是一个基于 **Rho Class** 深度优化的学术论文 LaTeX 模版，旨在生成紧凑、专业的 9pt 排版效果。
- **字号**: 9pt (许多顶级期刊的标准字号)。
- **布局**:
    - `main.cls`: 专为正文设计的双栏模版。
    - `sup.cls`: 专为补充材料设计的单栏模版（处理了特殊的 S.x 编号对齐）。
- **编译核心**: 必须使用 `XeLaTeX` 编译器以及 `biblatex` (配合 **biber** 后端)。

### 2. 文件结构
*   **main.cls**: 正文文档类（核心逻辑文件，无需修改）。
*   **sup.cls**: 补充材料文档类。
*   **main-sample.tex**: **正文编辑入口**，直接在此文件中填入你的内容。
*   **sup-sample.tex**: 补充材料编辑入口。
*   **ref.bib**: 参考文献数据库。
*   **rhobabel.sty / rhoenvs.sty**: 样式支持文件。

### 3. 如何编译 (至关重要)
本模版使用现代的 **BibLaTeX** 系统，因此必须使用 **Biber** 来处理参考文献，**不要**使用传统的 BibTeX。

**标准命令行编译顺序:**
```bash
xelatex main-sample
biber main-sample   <-- 注意这里是 biber，不是 bibtex
xelatex main-sample
xelatex main-sample
```

### 4. VS Code 配置指南 (解决参考文献不显示且编译报错)
如果你在 VS Code 中编译后发现参考文献全是问号 `[?]`，或者提示 `Citation undefined`，通常是因为 LaTeX Workshop 默认使用了 `bibtex`。

**最简单的解决方法：**
在你的 `.tex` 文件（如 `main-sample.tex`）的**第一行**，加入以下魔法注释（Magic Comments）：
```latex
%!TEX program = xelatex
%!BIB program = biber
```
保存后，LaTeX Workshop 通常会自动识别并切换编译器。

**进阶解决方法 (修改 settings.json)：**
如果魔法注释无效，请手动配置 VS Code 的编译配方：

1.  打开设置 (`Ctrl + ,`)，搜索 `latex recip`。
2.  点击 `Check that the configuration file is valid` 或者右上角的 `{}` 图标进入 `settings.json`。
3.  确保你的 `recipes` 中包含显式调用 `biber` 的流程。将以下配置复制到你的 `settings.json` 中：

```json
    "latex-workshop.latex.recipes": [
        {
            "name": "XeLaTeX -> Biber -> XeLaTeX x2",
            "tools": [
                "xelatex",
                "biber",
                "xelatex",
                "xelatex"
            ]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        },
        {
            "name": "biber",
            "command": "biber",
            "args": [
                "%DOCFILE%"
            ]
        }
    ]
```
4.  保存配置。
5.  在 VS Code 左侧侧边栏点击 "LaTeX" 图标，在 "Build LaTeX project" 菜单下，选择 **"XeLaTeX -> Biber -> XeLaTeX x2"** 进行编译。

### 5. 其他常见问题
*   **Abstract 报错**: 如果你遇到 `Undefined control sequence \rhoabstract`，请检查 `\begin{abstract}...\end{abstract}` 是否放置在了 `\maketitle` **之前**（即导言区内）。这是本模版的特殊要求。
*   **图片路径**: 模版默认包含 `figures` 文件夹，建议将图片放在其中，或在导言区使用 `\graphicspath{{figures/}}` 指定路径。