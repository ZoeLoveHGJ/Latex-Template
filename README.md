# 学术 LaTeX 模板套件 | Academic LaTeX Template Suite

[中文](#中文说明) | [English](#english)

---

<a name="中文说明"></a>

## 中文说明

### 概述

这是一套面向**全流程学术写作与多出版社投稿**的高效模块化 LaTeX 模板工程。
* **100% 保持官方原版纯净度**：所有出版社模板（IEEE Transactions, IEEE Conference, Elsevier CAS ESWA, ACM SIGCONF, Springer LNCS）**完全遵循官方原生语法与官方类库**，绝不进行非标准魔改，可直接打包原版源文件向出版社系统投稿；
* **统一元数据常量层（`metadata/`）**：作者姓名、单位、邮箱、ORCID、基金项目统一定义一次，所有官方模板无缝填入，告别多处修改与错漏；
* **融入 SCU 学术写作与交叉引用规范**：在辅助包中原生提供 `\figref`, `\tabref`, `\eqnref`, `\secref`, `\algref` 等标准语义引用宏（带不可断行波浪号 `~`），跨出版商排版规范零成本对齐；
* **开箱即用**：一级目录（根目录）默认预置以 **IEEE Transactions** 为标准的主论文（`Main.tex`）、投稿附信（`Cover_Letter.tex`）与审稿回复信（`Response.tex`），点开即可直接写作与编译；
* **极简切换 6 大出版商标准模板**：
  1. `01_Custom_Preprint`：自定义现代学术预印本套件 (XeLaTeX + Biber)
  2. `02_IEEE_Transactions`：IEEE Transactions / Journals 官方原生标准
  3. `03_IEEE_Conference`：IEEE 旗舰会议官方原生标准 (INFOCOM, ICC 等)
  4. `04_Elsevier_ESWA`：Elsevier CAS 双栏官方原生标准 (ESWA 实战模板)
  5. `05_ACM_Conference`：ACM SIG 会议与期刊官方原生标准 (KDD, SIGMOD 等)
  6. `06_Springer_LNCS`：Springer LNCS 计算机科学经典顶会官方原生标准 (ECCV, MICCAI 等)
* **参考文献数据与样式解耦**：基于单一 `bib/refer.bib`，通过项目维护的 `bib/journal_abrv.bib`（缩写字典）与 `bib/journal_full.bib`（全称字典）复用 venue 数据；最终显示仍由目标出版社的官方 `.bst` 和 author guideline 决定，不能跨出版社套用规则；
* **文献数据库自动诊断脚本**：提供 [`scripts/bib_checker.py`](scripts/bib_checker.py)，一键检测文献库字段完整性与宏绑定情况；
* **高雅美化**：全局默认采用经典**学术墨绿色**（`#0B6623`）超链接与引用高亮；表格默认采用**自适应宽度 + 垂直水平全居中**；参考文献引入 `xurl` **任意字符智能换行**，彻底解决 URL / 表格溢出栏外的问题；
* **VS Code 极简视图**：配置了 `files.exclude`，自动过滤隐藏 `.aux`、`.blg`、`.bcf`、`.log` 等无用中间文件。

---

### 项目目录结构

```text
Latex-Template/
├── Main.tex                            # 【一级目录主入口】默认 IEEE Transactions 官方标准双栏
├── Cover_Letter.tex                    # 【一级目录】投稿附信
├── Response.tex                        # 【一级目录】审稿逐条回复信
├── compile.bat                         # 根目录一键自动化终端编译脚本 (支持 1-10 目标)
│
├── docs/                               # 【仓库自有使用指南】（不修改官方模板）
│   └── bibliography/
│       ├── ieee-references.md          # IEEE 参考文献规则、项目覆盖项与示例
│       └── elsevier-references.md      # Elsevier 期刊参考文献规则、DOI 与 venue 名称指南
│
├── metadata/                           # 【核心元数据统一管理层】
│   ├── paper_info.tex                  # 论文主标题、页眉标题、摘要、关键词、基金项目
│   └── authors_info.tex                # 结构化作者姓名、单位常量、ORCID、邮箱
│
├── sections/                           # 【核心共享内容】（所有模板共享此目录）
│   ├── 01_introduction.tex             # 引言 (含真实文献引用)
│   ├── 02_related_work.tex             # 相关工作 (含真实文献引用)
│   ├── 03_method.tex                   # 方法与数学推导
│   ├── 04_experiments.tex              # 实验对比 (自适应居中表格与 SCU 引用)
│   └── 05_conclusion.tex               # 结论与未来展望
│
├── bib/                                # 【统一参考文献库与宏字典】
│   ├── refer.bib                       # 真实学术文献数据库 (唯一事实来源)
│   ├── journal_abrv.bib                # 【项目维护】111+ 期刊会议缩写（投稿前按目标 venue 复核）
│   └── journal_full.bib                # 【项目维护】111+ 期刊会议全称
│
├── figures/                            # 【统一插图库】
│
├── templates/                          # 【多出版社官方独立模板包】
│   ├── 01_Custom_Preprint/             # 自定义现代学术预印本套件 (XeLaTeX + Biber)
│   ├── 02_IEEE_Transactions/           # IEEE Transactions / Journals 官方原生标准
│   ├── 03_IEEE_Conference/             # IEEE 旗舰会议官方原生标准
│   ├── 04_Elsevier_ESWA/               # Elsevier CAS 双栏官方原生标准 (ESWA 实战模板)
│   ├── 05_ACM_Conference/              # ACM SIG 会议与期刊官方原生标准
│   └── 06_Springer_LNCS/               # Springer LNCS 计算机经典顶会官方原生标准
│
├── packages/                           # 【底层依赖宏包与官方类库】
│   ├── custom/                         # 自定义模板类 (main.cls, sup.cls, response.cls 等)
│   └── publishers/                     # 官方出版社类库 (ieee, elsevier_cas, acm, springer_lncs)
│       └── compat_helper.sty           # 轻量非侵入式辅助宏 (xurl断行、居中表格、SCU规范)
│
├── scripts/                            # 【科研实用诊断工具】
│   └── bib_checker.py                  # BibTeX 文献完整性与宏字典诊断脚本
│
└── .vscode/settings.json               # VS Code 自动构建与隐藏中间文件配置
```

---

### 参考文献规范指南

参考文献规则以**目标期刊/会议当前 author guideline 与官方模板**为最高优先级。IEEE、ACM、Springer LNCS、Elsevier、USENIX、Nature/Springer Nature 的样式、缩写和在线资源显示规则不可混用。

* [IEEE Journals / Transactions 参考文献指南](docs/bibliography/ieee-references.md)：区分 IEEE 通用惯例、`IEEEtran.bst` 默认行为和可选的项目级 compact profile，并提供 BibTeX 与 `IEEEtranBSTCTL` 示例。
* [Elsevier Journals 参考文献指南](docs/bibliography/elsevier-references.md)：区分
  Your Paper Your Way、具体期刊 Guide for Authors 和 CAS/elsarticle 样式行为，
  说明 DOI、URL、期刊全称/缩写、数据集与 BibTeX 录入要点。

---

### SCU 交叉引用规范使用速查

在正文中编写引用时，推荐使用标准宏：
* **图表引用**：`\figref{fig:label}`（自动输出 `Fig.~1`）
* **表格引用**：`\tabref{tab:label}`（自动输出 `Table~1`）
* **公式引用**：`\eqnref{eq:label}`（自动输出 `Eq.~(1)`）
* **章节引用**：`\secref{sec:label}`（自动输出 `Section~2`）
* **算法引用**：`\algref{alg:label}`（自动输出 `Algorithm~1`）

---

### 快速开始与编译指南

#### 1. 命令行一键编译 (`compile.bat`)

```cmd
compile.bat                     # 默认直接编译根目录 Main.tex (IEEE Trans)
compile.bat Cover_Letter        # 编译根目录投稿信
compile.bat Response            # 编译根目录审稿回复信
compile.bat 04_Elsevier_ESWA    # 单独编译 Elsevier ESWA 模板
compile.bat 06_Springer_LNCS    # 单独编译 Springer LNCS 模板
compile.bat ALL                 # 一键编译根目录及全部出版社版本
```

#### 2. 文献数据库诊断 (`bib_checker.py`)

```cmd
python scripts/bib_checker.py
```
