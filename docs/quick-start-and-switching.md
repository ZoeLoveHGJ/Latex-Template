# 快速接入与模板切换指南

本文说明如何把一篇新论文快速接入本仓库，并在多个出版社模板之间做可验证切换。

核心原则：共享论文内容和元数据，但不共享出版社规则。IEEE、Elsevier、ACM、Springer LNCS 等目标的 class、BST、参考文献显示和投稿打包要求都应以各自官方模板与 author guideline 为准。

## 1. 新论文最小接入清单

通常只需要先改这些仓库自有文件：

1. `metadata/paper_info.tex`
   - 标题、短标题、默认期刊名、摘要、关键词、基金。
2. `metadata/authors_info.tex`
   - 作者、ORCID、邮箱、单位、常用作者组合。
3. `sections/*.tex`
   - 正文主体内容。所有 publisher 模板复用这里的章节。
4. `bib/refer.bib`
   - 唯一主文献库。不要为了某个样式显示效果删除 DOI、URL 或作者。
5. `figures/`
   - 新项目图片统一放这里。各主模板的 `\graphicspath` 已指向这个目录。

除非目标期刊/会议 author kit 明确要求，不要修改：

- `packages/publishers/**/*.cls`
- `packages/publishers/**/*.bst`
- `packages/publishers/**` 下的官方 vendor 文件

若必须按投稿系统做单层打包或替换官方模板，应从当前仓库导出 submission copy，再在副本中处理。

## 2. 推荐编译入口

在仓库根目录运行：

```cmd
compile.bat Main
```

用于默认 IEEE Transactions 根入口。

```cmd
compile.bat 04_Elsevier_ESWA
```

用于快速检查 Elsevier CAS 示例。

```cmd
compile.bat PUBLISHERS
```

用于快速检查官方 publisher 模板链路：IEEE Transactions、IEEE Conference、Elsevier、ACM、Springer LNCS。该目标只覆盖当前仓库中的 pdfLaTeX + BibTeX 官方模板入口，适合作为“快速切换模板是否还健康”的日常检查。

```cmd
compile.bat ALL
```

用于检查根入口、publisher 模板以及自定义 XeLaTeX/Biber 预印本链路。这个目标会依赖本机 XeLaTeX、Biber、字体配置和 Kpathsea 状态；若本机 XeLaTeX 环境损坏，`ALL` 应失败，而不是伪装成功。

当前 `compile.bat` 是严格模式：

- 每一步 LaTeX/BibTeX/Biber 命令失败都会立即停止；
- 使用 `-halt-on-error` 防止错误被吞掉；
- 目标 PDF 未生成会返回失败；
- `ALL` 和 `PUBLISHERS` 会把子目标失败传播为非零退出码。

## 3. 模板切换矩阵

| 目标 | 入口 | 编译链 | 参考文献字典 | 说明 |
| --- | --- | --- | --- | --- |
| 默认 IEEE Journal / Transactions | `Main.tex` | pdfLaTeX + BibTeX | `bib/journal_abrv.bib` | 根目录主入口 |
| IEEE Transactions | `templates/02_IEEE_Transactions/Main_IEEE_Trans.tex` | pdfLaTeX + BibTeX | `bib/journal_abrv.bib` | 官方 IEEEtran journal 模式 |
| IEEE Conference | `templates/03_IEEE_Conference/Main_IEEE_Conf.tex` | pdfLaTeX + BibTeX | `bib/journal_abrv.bib` | 官方 IEEEtran conference 模式 |
| Elsevier ESWA / CAS | `templates/04_Elsevier_ESWA/Main_Elsevier.tex` | pdfLaTeX + BibTeX | `bib/journal_full.bib` | 当前仓库 profile 使用全称字典 |
| ACM Conference | `templates/05_ACM_Conference/Main_ACM.tex` | pdfLaTeX + BibTeX | `bib/journal_full.bib` | 使用 ACM 官方参考文献样式 |
| Springer LNCS | `templates/06_Springer_LNCS/Main_Springer.tex` | pdfLaTeX + BibTeX | `bib/journal_full.bib` | 使用 LNCS 官方样式 |
| Custom Preprint | `templates/01_Custom_Preprint/Main.tex` | XeLaTeX + Biber | `bib/refer.bib` | 自定义预印本，已接入统一 metadata |

切换模板时，优先运行目标模板对应命令，而不是先修改官方 class 或 BST。

## 4. 参考文献切换规则

本仓库用一份主文献库 `bib/refer.bib` 搭配两个 venue 字典：

- `bib/journal_abrv.bib`：缩写 profile，主要用于 IEEE；
- `bib/journal_full.bib`：全称 profile，主要用于当前 Elsevier / ACM / Springer 示例。

录入文献时推荐：

```bibtex
journal = J_ESWA
```

而不是把期刊名硬编码到每一条文献里。这样目标模板加载 `journal_full.bib` 时可输出全称，加载 `journal_abrv.bib` 时可输出缩写。

注意：

- 字典是项目维护工具，不是出版社官方规则本身；
- 同一份稿件不要同时加载 full 和 abbreviated 字典；
- Elsevier 是否要求全称或缩写，以目标期刊 Guide for Authors 为准；
- IEEE 的 compact profile 不能复制到 ACM、Elsevier 或 LNCS；
- DOI、URL、访问日期应保留为结构化字段，由目标样式决定是否显示。

更多细节见：

- `docs/bibliography/ieee-references.md`
- `docs/bibliography/elsevier-references.md`

## 5. 投稿前验证清单

每次切换投稿目标后，至少做一次：

```cmd
python scripts/bib_checker.py
compile.bat PUBLISHERS
git diff --check
```

如果目标包含自定义预印本、Cover Letter 或 Response，再运行：

```cmd
compile.bat ALL
```

然后人工检查生成 PDF：

- 标题、作者、单位、邮箱是否来自 `metadata/`；
- section 内容是否完整；
- 图是否从 `figures/` 正确加载；
- 参考文献作者截断、标题大小写、venue、DOI、URL 是否符合目标 publisher；
- `.blg` / `.bbl` 中是否有未解析字段、重复 DOI 或 undefined references。

`scripts/bib_checker.py` 只证明仓库级字段和宏绑定健康，不等于出版社合规；最终以目标期刊/会议 guideline 和生成 PDF 为准。
