# Elsevier Journals 参考文献指南

本文用于维护本仓库中的 Elsevier 期刊参考文献数据和投稿配置，不替代
Elsevier 或具体期刊的最新 Guide for Authors。仓库只在自有文档和数据层
提供指导；不要为满足某篇论文的显示偏好而修改
`packages/publishers/elsevier_cas/` 下的官方 class、BST 或其他 vendor 文件。

官方来源（检索日期：2026-08-28）：

<!-- markdownlint-disable MD013 -->

- Elsevier Journal Article Publishing Support Center: [How should I prepare the references in my manuscript?](https://service.elsevier.com/app/answers/detail/a_id/28224/supporthub/publishing)
- Elsevier: [Guide for authors - Your Paper Your Way](https://www.elsevier.com/subject/next/guide-for-authors)
- Elsevier: [LaTeX instructions for authors](https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions)
- ISSN: [List of Title Word Abbreviations](https://www.issn.org/services/online-services/access-to-the-ltwa/)

<!-- markdownlint-enable MD013 -->

## 1. 适用范围与优先级

遇到冲突时，按以下顺序执行：

1. 目标期刊当前的 Guide for Authors、投稿检查清单和编辑部要求；
2. 目标期刊投稿包随附的 Elsevier 官方模板、参考文献样式和 sample manuscript；
3. Elsevier Support Center、Your Paper Your Way 和 LaTeX instructions 的通用说明；
4. 本仓库指南与项目级配置。

Elsevier 是出版社，不是单一参考文献样式。不同 Elsevier 期刊可能使用
numbered、name-year、APA、Harvard、Vancouver 或期刊专属样式；是否使用
期刊缩写、作者截断、访问日期、数据集前缀和 DOI 展示形式，最终都应以
目标期刊为准。

## 2. 与其他出版社规则隔离

Elsevier 期刊应使用目标期刊 Guide for Authors、Elsevier CAS/elsarticle
模板和指定 `.bst`。不要套用 IEEE 的 `IEEEtranBSTCTL`、`Proc. IEEE ...`
紧凑写法、ACM 或 LNCS 样式。

IEEE 应使用目标 venue 指南、IEEE 官方模板及 `IEEEtran` 系列样式。不要
套用 Elsevier numbered/name-year 示例，也不要假设 Elsevier CAS 的 DOI/URL
输出行为适用于 IEEE。

ACM 应使用 ACM 官方模板和 `ACM-Reference-Format.bst`。不要套用 Elsevier
CAS `.bst` 或 Elsevier 期刊缩写策略。

Springer LNCS 应使用目标会议要求、LNCS author instructions 和 `splncs04.bst`。
不要套用 Elsevier 期刊的 numbered/name-year 示例。

USENIX 应使用对应会议当年的 author kit 与引用要求。不要套用 Elsevier CAS、
IEEE 或 LNCS 的 venue 显示规则。

Nature / Springer Nature 期刊应使用具体期刊的 author instructions 和官方样式。
不要套用 Elsevier、IEEE、LNCS 的 `.bst` 和显示偏好。

`bib/refer.bib` 可以作为共享数据源，但共享数据不等于共享渲染规则。
Elsevier 投稿前必须重新检查 `.bbl` 和 PDF，而不是假设 IEEE 或 ACM 中
看起来合适的输出也适合 Elsevier。

## 3. Elsevier 官方通用要求

### 3.1 Your Paper Your Way 初稿规则

Elsevier 的 Your Paper Your Way 允许初稿参考文献使用任意一致的样式，但这
不是“元数据可以随便省略”。Elsevier 明确要求在适用时保留作者、期刊名或
书名、章节题名或文章题名、出版年、卷号、章节号以及文章号或页码，并
强烈鼓励提供 DOI。接受后，目标期刊的正式参考文献样式会在 proof 阶段
套用；缺失数据会被要求作者补正。

本仓库的维护原则：

- 初稿可以先保持一致，但 `.bib` 中应尽量保存完整结构化元数据；
- DOI 存入 `doi` 字段，URL 存入 `url` 字段，访问日期放入 `note`；
- 不要为了某个样式的显示结果删除作者、标题、DOI 或 URL；
- 最终投稿前按目标期刊 Guide for Authors 检查实际输出。

### 3.2 期刊 Guide for Authors 优先

Elsevier Support Center 要求作者检查目标期刊的 Guide for Authors。每个
Elsevier 期刊页面都会说明是否支持 Your Paper Your Way，以及是否有具体
reference style、Mendeley/EndNote 样式、LaTeX 样式或额外投稿项目。

如果目标期刊给出具体示例，应把示例当作最终规则。比如同为 Elsevier：

- numbered 期刊通常按正文首次出现顺序编号；
- Harvard/name-year 期刊可能按作者和年份排序；
- Vancouver 风格可能要求超过 6 位作者时列前 6 位加 `et al.`；
- 数据集引用可能要求在参考文献项前显示 `[dataset]`；
- 网页资源可能要求访问日期。

这些差异都不能写成 Elsevier 全局强制规则。

### 3.3 LaTeX 与 BibTeX

Elsevier 的 LaTeX instructions 说明：有些期刊要求特定参考文献样式，作者
应检查目标期刊 Guide for Authors；相关 BibTeX 样式通常随 sample manuscript
提供。本仓库的 Elsevier 示例位于 `templates/04_Elsevier_ESWA/`，使用 CAS
双栏模板和：

```tex
\bibliographystyle{../../packages/publishers/elsevier_cas/cas-model2-names}
\bibliography{../../bib/journal_full,../../bib/refer}
```

这是本仓库当前 Elsevier ESWA 示例的项目配置，不代表所有 Elsevier 期刊
必须使用 `journal_full.bib` 或 `cas-model2-names.bst`。若目标期刊投稿包
要求 `elsarticle-num.bst`、`elsarticle-harv.bst` 或其他样式，应以目标包
为准。

Elsevier 还要求 LaTeX 投稿源文件打包完整。向 Editorial Manager 上传前，应
确认 `.tex`、`.bib`、图片、表格，以及 TeX Live 中没有的 class/package 均
包含在压缩包中；本仓库可保留目录结构用于维护，但投稿系统或期刊说明若
要求单层打包，应按其要求准备 submission copy。

## 4. DOI、URL 与 online 信息

### 4.1 DOI 应使用结构化字段

Elsevier 通用说明强烈鼓励提供 DOI，官方参考文献示例也展示 DOI 链接。对
本仓库而言，Elsevier 期刊投稿应把 DOI 视为“可获得就必须保留”的元数据。

推荐：

```bibtex
doi = {10.1016/j.eswa.2026.000001}
```

不推荐：

```bibtex
note = {\url{https://doi.org/10.1016/j.eswa.2026.000001}}
url  = {https://doi.org/10.1016/j.eswa.2026.000001}
doi  = {https://doi.org/10.1016/j.eswa.2026.000001}
doi  = {doi:10.1016/j.eswa.2026.000001}
```

原因：

- `doi` 字段让 CAS/elsarticle `.bst` 控制 DOI 的前缀、链接和位置；
- DOI URL 塞进 `note` 会让不同出版社无法单独控制 DOI 与注释；
- DOI 同时出现在 `doi` 和 `url` 中可能导致重复输出；
- 当前 `packages/publishers/elsevier_cas/cas-model2-names.bst` 明确读取并输出 `doi` 字段。

如果 DOI 不存在，才考虑提供原始 `url`。网页、软件和报告类资源可同时保留 `url` 与访问日期；正式出版物有 DOI 时，优先 DOI。

### 4.2 URL 与访问日期

在线资源应把网页地址放入 `url`，不要手写 `\url{...}`：

```bibtex
url  = {https://example.org/software}
note = {(accessed 28 August 2026)}
```

若目标期刊示例使用 `Accessed 13 March 2003`、
`[accessed 13 March 2003]` 或 `(accessed 13 March 2003)`，按目标期刊
写法调整。访问日期是网页资源常见要求，但不是每篇 journal article 都需要。

## 5. 期刊名称：全称还是缩写

不要把“Elsevier 期刊名一律不要缩写”写成全局规则。Elsevier Support Center
在多个 numbered / APA / Vancouver 示例下给出的通用说明是：期刊名应按
ISSN 的 List of Title Word Abbreviations 缩写。与此同时，具体期刊的
Guide for Authors 或投稿系统也可能给出不同的 full-title / abbreviation
要求。

本仓库采用双字典维护：

`bib/journal_full.bib` 用于目标期刊要求全称，或投稿模板明确用全称时；例如
`Expert Systems with Applications`。

`bib/journal_abrv.bib` 用于目标期刊要求 LTWA/ISO-4 缩写，或样式示例使用
缩写时；例如 `Expert Syst. Appl.`。

使用规则：

- 同一篇稿件不要同时加载 full 和 abbreviated 字典；
- 当前 Elsevier ESWA 示例加载 `journal_full.bib`，这是仓库 profile，不是 Elsevier 官方全局规则；
- 若目标期刊 Guide for Authors 要求 LTWA 缩写，应切换到 `journal_abrv.bib` 或按官方样式导出；
- 新增 venue 时同时维护两个字典，并在投稿前核对 ISSN LTWA 或期刊官方页面。

示例：

```bibtex
journal = J_ESWA
```

当主文档加载 `journal_full.bib` 时输出：

```text
Expert Systems with Applications
```

当主文档加载 `journal_abrv.bib` 时输出：

```text
Expert Syst. Appl.
```

## 6. 作者、标题与大小写

### 6.1 作者

- 主 `.bib` 保留完整作者列表和原始顺序；
- 不要手工删除作者来制造 `et al.`；
- 只有目标期刊样式或 Guide for Authors 明确要求时，才在投稿专用副本中使用 `and others`；
- 团体作者使用额外花括号保护，例如 `author = {{Open Policy Agent Project}}`。

Elsevier Support Center 的 Vancouver 示例提到超过 6 位作者时列前 6 位加
`et al.`，但这只适用于相应风格；APA、Harvard、numbered 和具体期刊样式
可能不同。

### 6.2 标题大小写

Elsevier 通用示例没有给出类似 IEEE 的单一 sentence-case 总规则。维护
`.bib` 时应以来源标题和目标期刊样式为准，并用花括号保护必须保留大小写的
token：

```bibtex
title = {{R{\'e}nyi} differential privacy accounting for {TensorFlow Privacy}}
title = {A {SoK} of policy enforcement on {Linux} and {Intel SGX}}
title = {From {SLSA} provenance to {in-toto} and {Sigstore} verification}
```

需要保护的典型写法：

- 缩写和标准：`{SGD}`、`{SSDF}`、`{SLSA}`、`{PROV-DM}`、`{PROV}`、`{TPM}`、`{MAC}`、`{TLA+}`；
- 产品、系统和项目名：`{TensorFlow Privacy}`、`{Open Policy Agent}`、
  `{DP-Auditorium}`、`{PrivacyAsst}`、`{InferDPT}`、`{PriRAG}`、
  `{ProSan}`、`{DPolicy}`；
- 专名及固定拼写：`{R{\'e}nyi}`、`{Linux}`、`{Intel SGX}`、`{SoK}`、
  `{in-toto}`、`{Sigstore}`、`{Cohere}`。

普通术语如 `differential privacy`、`machine learning`、`federated learning`、
`large language models` 通常不需要为了保留标题式大写而加花括号。

## 7. BibTeX 条目示例

以下均为字段结构示例，作者、页码、编号、日期、URL 和 DOI 是占位数据，
不能作为真实文献引用。提交前应逐字段核对原始出版页面和目标期刊
Guide for Authors。

### 7.1 Journal article

```bibtex
@article{elsevier:article,
  author  = {Lovelace, Ada and Hopper, Grace and Lamarr, Hedy},
  title   = {{R{\'e}nyi} differential privacy accounting for
             {TensorFlow Privacy}},
  journal = J_ESWA,
  year    = {2026},
  volume  = {260},
  number  = {1},
  pages   = {123456},
  doi     = {10.1016/j.eswa.2026.123456}
}
```

说明：

- Elsevier 期刊常见 article number 可放入 `pages`，因为很多传统 `.bst` 没有 `articleno` 字段；
- 若目标样式支持 `eid`、`article-number` 或 CSL 导出，应按目标样式使用；
- DOI 不要放在 `note` 里。

### 7.2 Conference paper

```bibtex
@inproceedings{elsevier:conference,
  author    = {Hopper, Grace and Lovelace, Ada and Lamarr, Hedy and
               Hamilton, Margaret},
  title     = {A {SoK} of policy enforcement on {Linux} and {Intel SGX}},
  booktitle = {Proceedings of the IEEE Symposium on Security and Privacy},
  year      = {2026},
  pages     = {20--31},
  doi       = {10.1109/SP00000.2026.00001}
}
```

说明：

- Elsevier 期刊的参考文献列表不应默认使用 IEEE 的 `Proc. IEEE S\&P` compact 写法；
- 若目标期刊示例使用会议全称，就写全称；
- 若目标期刊使用缩写或参考管理器导出结果，以目标样式为准。

### 7.3 Book

```bibtex
@book{elsevier:book,
  author    = {Lovelace, Ada and Hamilton, Margaret},
  title     = {Engineering privacy systems with {TLA+}},
  publisher = {Example Academic Press},
  address   = {New York},
  edition   = {2nd},
  year      = {2026}
}
```

### 7.4 Chapter in edited book

```bibtex
@incollection{elsevier:chapter,
  author    = {Mettam, George R. and Adams, Louise B.},
  title     = {How to prepare an electronic version of your article},
  booktitle = {Introduction to the Electronic Age},
  editor    = {Jones, Brian S. and Smith, Robert Z.},
  publisher = {E-Publishing Inc.},
  address   = {New York},
  year      = {2026},
  pages     = {281--304},
  doi       = {10.0000/example.chapter}
}
```

### 7.5 Technical report

```bibtex
@techreport{elsevier:report,
  author      = {Hamilton, Margaret},
  title       = {Binding {PROV-DM} evidence to {SLSA} attestations},
  institution = {Example Research Laboratory},
  type        = {Technical Report},
  number      = {TR-2026-04},
  address     = {Chengdu},
  year        = {2026},
  url         = {https://example.org/reports/TR-2026-04},
  note        = {(accessed 28 August 2026)}
}
```

### 7.6 Software or online resource

`@misc` 在不同 `.bst` 中更可移植；当前 CAS 样式也支持 `@webpage`，但字段
较少。软件、网页和机构报告建议优先用 `@misc` 并验证 `.bbl`。

```bibtex
@misc{elsevier:software,
  author       = {{Sigstore Project}},
  title        = {{Sigstore} verification for {Cohere} model artifacts},
  howpublished = {Software documentation},
  year         = {2026},
  url          = {https://example.org/software},
  note         = {(accessed 28 August 2026)}
}
```

### 7.7 Dataset

Elsevier 示例会把数据集标成 `[dataset]`，但传统 BibTeX 样式不一定有专门的
`@dataset` 类型。若目标期刊要求数据引用，优先使用目标期刊推荐的数据仓库
导出格式；用 BibTeX 时应至少保留作者、题名、仓库、版本、年份和 DOI。

```bibtex
@misc{elsevier:dataset,
  author       = {Oguro, Makoto and Imahiro, Shinji and Saito, Satoshi and
                  Nakashizuka, Tohru},
  title        = {Mortality data for Japanese oak wilt disease and surrounding
                  forest compositions},
  howpublished = {Mendeley Data, v1},
  year         = {2026},
  doi          = {10.17632/example.dataset.1},
  note         = {[dataset]}
}
```

提交前检查生成的 `.bbl`：如果 `[dataset]` 位置不符合目标期刊示例，不要修改
官方 `.bst`；应改用目标期刊提供的样式、参考管理器导出，或按编辑部允许的
方式在 submission copy 中处理。

## 8. 投稿前检查

1. 打开目标 Elsevier 期刊页面，确认 Guide for Authors、Your Paper Your Way
   状态、reference style 和 LaTeX author kit。
2. 确认主文档使用目标期刊指定的 class、BST 和编译链，未修改 `packages/publishers/elsevier_cas/` 中的官方文件。
3. 检查 `.bib` 是否保留完整作者、文章标题、期刊/书名、年份、卷期、页码或文章号、DOI、URL 和访问日期。
4. 把可获得的 DOI 迁移到结构化 `doi` 字段，移除 `note = {\url{https://doi.org/...}}` 这类旧写法。
5. 按目标期刊决定使用 `journal_full.bib` 还是 `journal_abrv.bib`；若要求 LTWA 缩写，核对 ISSN LTWA。
6. 对照目标样式检查作者截断、标题大小写、期刊名、会议名、DOI、URL、访问日期、数据集前缀和 article number。
7. 运行 `python scripts/bib_checker.py` 做仓库级字段和宏绑定诊断。该脚本通过不等于出版社合规。
8. 完整编译后检查 `.blg`、`.bbl` 和 PDF；若参考文献输出与目标
   Guide for Authors 冲突，以目标 Guide for Authors 和官方样式为准。
