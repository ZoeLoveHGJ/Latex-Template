# IEEE Journals / Transactions 参考文献指南

本文用于维护本仓库中的 IEEE 参考文献数据和投稿配置，不替代 IEEE 或具体期刊的最新要求。仓库仅在自有文档和数据层提供指导；不要为满足某篇论文的显示偏好而修改 `packages/publishers/` 下的官方 class、BST 或其他 vendor 文件。

## 1. 适用范围与优先级

遇到冲突时，按以下顺序执行：

1. 目标期刊或会议当前的 author guideline、投稿检查清单和编辑部要求；
2. 目标 venue 随投稿包提供的官方模板与参考文献样式；
3. IEEE Reference Guide、IEEE Editorial Style Manual 和所用 `IEEEtran.bst` 的说明；
4. 本仓库指南与项目级覆盖项。

IEEE Journals / Transactions 通常使用 `IEEEtran.bst`，但不同期刊、会议、模板版本和投稿阶段可能对作者截断、DOI、URL、访问日期及 online 信息有不同要求。提交前必须以目标 venue 的当前说明和实际编译结果复核。

## 2. 出版社规则必须隔离

| 投稿目标 | 应使用的依据 | 不应套用的内容 |
| --- | --- | --- |
| IEEE Journals / Transactions / Conferences | 目标 venue 指南、IEEE 官方模板及 `IEEEtran` 系列样式 | ACM、LNCS、Elsevier 的 BST 和显示规则 |
| ACM | ACM 官方模板和 `ACM-Reference-Format.bst` | IEEE 缩写表、`IEEEtranBSTCTL` |
| Springer LNCS | 目标会议要求、LNCS author instructions 和 `splncs04.bst` | IEEE 的作者截断与 online 前缀配置 |
| Elsevier | 目标期刊指南和该模板指定的 CAS/numbered/name-year 样式 | IEEE 的 venue 缩写和字段显示偏好 |
| USENIX | 对应会议当年的 author kit 与引用要求 | IEEE `.bst` 和统一的 `Proc. IEEE ...` 写法 |
| Nature / Springer Nature 期刊 | 具体期刊的 author instructions 和官方样式 | IEEE、LNCS 或其他 Springer 产品线的规则 |

`bib/refer.bib` 可以作为共享数据源，但共享数据不等于共享渲染规则。`bib/journal_abrv.bib` 与 `bib/journal_full.bib` 是本项目维护的映射，不是对所有出版社均具约束力的官方表；新增或修改 venue 时，应同时核对目标出版方的正式名称或认可缩写。

## 3. IEEE 通用录入原则

### 3.1 作者

- 在主文献库中尽量保存来源给出的完整作者列表和原始顺序，让目标 `.bst` 决定最终显示；不要为了某次投稿手工删除作者。
- 团体作者使用额外花括号保护，例如 `author = {{Open Policy Agent Project}}`。
- “超过三人显示前三位加 *et al.*”不是所有 IEEE 出版物的统一规定，只能作为目标 venue 明确允许时的项目级覆盖项。

### 3.2 标题与大小写保护

论文标题通常按 sentence case 录入：首词和必须保留大小写的词之外，不把普通实词全部首字母大写。BibTeX 样式可能改变标题大小写，因此应只给必须保持原样的 token 加花括号，不要把整个标题包进双层花括号。

需要保护的典型写法：

- 缩写和标准：`{SGD}`、`{SSDF}`、`{SLSA}`、`{PROV-DM}`、`{PROV}`、`{TPM}`、`{MAC}`、`{TLA+}`；
- 产品、系统和项目名：`{TensorFlow Privacy}`、`{Open Policy Agent}`、`{DP-Auditorium}`、`{PrivacyAsst}`、`{InferDPT}`、`{PriRAG}`、`{ProSan}`、`{DPolicy}`；
- 专名及固定拼写：`{R{\'e}nyi}`、`{Linux}`、`{Intel SGX}`、`{SoK}`、`{in-toto}`、`{Sigstore}`、`{Cohere}`。

普通术语如 `differential privacy`、`machine learning`、`federated learning`、`large language models` 通常保持 sentence case，无需为了保留标题式大写而加花括号。

```bibtex
title = {{R{\'e}nyi} differential privacy accounting for {TensorFlow Privacy}}
title = {A {SoK} of policy enforcement on {Linux} and {Intel SGX}}
title = {From {SLSA} provenance to {in-toto} and {Sigstore} verification}
```

### 3.3 期刊和会议名

- IEEE 参考文献通常按 IEEE 约定使用期刊和会议名称缩写；不要自行发明缩写。
- 优先复用已核对的宏，例如 `journal = J_TPAMI` 或 `booktitle = C_INFOCOM`。不在字典中的 venue 应先查目标指南或正式缩写，再同时维护 `journal_abrv.bib` 与 `journal_full.bib`。
- BibTeX 中的 `&` 必须写成 `\&`。例如项目级紧凑写法应录为 `booktitle = {Proc. IEEE S\&P}`。

本仓库中的缩写示例：

| 宏 | 缩写输出 |
| --- | --- |
| `J_TPAMI` | `IEEE Trans. Pattern Anal. Mach. Intell.` |
| `J_JSAC` | `IEEE J. Sel. Areas Commun.` |
| `J_TIFS` | `IEEE Trans. Inf. Forensics Secur.` |
| `C_INFOCOM` | `Proc. IEEE INFOCOM` |
| `C_SP` | `Proc. IEEE S&P`（BibTeX 字典内写作 `S\&P`） |

`Proc. IEEE S&P` 这类直接缩写属于本仓库可选的 compact IEEE-style profile，不代表所有 IEEE venue 的统一强制形式。若目标 venue 要求展开为正式会议名或使用其他认可缩写，以其要求为准。

### 3.4 DOI、URL 与 online 信息

- DOI 优先存入结构化 `doi` 字段，URL 存入 `url` 字段；不要把 DOI URL 塞进 `note = {\url{...}}`，否则样式无法分别控制 DOI、URL 和注释。
- 是否显示 DOI、URL、`[Online]`、`Available:` 和访问日期，由目标样式及 venue 要求决定。不能把某次投稿的隐藏偏好描述成 IEEE 通则。
- 本仓库当前的 `IEEEtran.bst` 支持通过 `CTLuse_url` 控制 `url` 输出，启用时默认添加 `[Online]. Available:` 前缀；它没有读取 `doi` 字段。其他版本或其他样式的行为可能不同，必须检查生成的 `.bbl` 和 PDF。
- 若项目要求隐藏 DOI，仍建议在主文献库保留 `doi` 元数据，并通过目标样式支持的配置或投稿专用数据导出控制显示。不要修改官方 `.bst`，也不要破坏主数据来获得一次性的版面效果。

## 4. BibTeX 条目示例

以下均为字段结构示例，作者、页码、编号、日期、URL 和 DOI 是占位数据，不能作为真实文献引用。提交前应逐字段核对原始出版页面。

### 4.1 Journal article

```bibtex
@article{example:article,
  author  = {Lovelace, Ada and Hopper, Grace and Lamarr, Hedy},
  title   = {{R{\'e}nyi} differential privacy accounting for {TensorFlow Privacy}},
  journal = J_TIFS,
  year    = {2026},
  volume  = {21},
  number  = {4},
  pages   = {100--112},
  doi     = {10.0000/example.article}
}
```

### 4.2 Conference paper

```bibtex
@inproceedings{example:conference,
  author    = {Hopper, Grace and Lovelace, Ada and Lamarr, Hedy and Hamilton, Margaret},
  title     = {A {SoK} of policy enforcement on {Linux} and {Intel SGX}},
  booktitle = C_SP,
  year      = {2026},
  pages     = {20--31},
  doi       = {10.0000/example.conference}
}
```

### 4.3 Technical report

```bibtex
@techreport{example:report,
  author      = {Hamilton, Margaret},
  title       = {Binding {PROV-DM} evidence to {SLSA} attestations},
  institution = {Example Research Laboratory},
  type        = {Technical Report},
  number      = {TR-2026-04},
  address     = {Chengdu, China},
  year        = {2026},
  url         = {https://example.org/reports/TR-2026-04}
}
```

### 4.4 Book

```bibtex
@book{example:book,
  author    = {Lovelace, Ada and Hamilton, Margaret},
  title     = {Engineering privacy systems with {TLA+}},
  publisher = {Example Academic Press},
  address   = {New York, NY, USA},
  edition   = {2nd},
  year      = {2026}
}
```

### 4.5 Thesis

```bibtex
@phdthesis{example:thesis,
  author  = {Lamarr, Hedy},
  title   = {{SSDF} and {in-toto} controls for reproducible privacy systems},
  school  = {Example University},
  address = {Chengdu, China},
  year    = {2026}
}
```

### 4.6 Software or online resource

`@electronic` 是 `IEEEtran.bst` 支持的扩展类型；若目标样式不支持，应按其文档改用 `@misc` 或指定类型。

```bibtex
@electronic{example:software,
  author       = {{Sigstore Project}},
  title        = {{Sigstore} verification for {Cohere} model artifacts},
  organization = {Example Foundation},
  year         = {2026},
  url          = {https://example.org/software},
  note         = {Accessed: Aug. 27, 2026}
}
```

## 5. 可选项目级 compact IEEE-style profile

只有在目标 venue 明确允许且项目确实需要时，才启用以下覆盖项：

| 项目覆盖项 | 含义 | IEEE 通用要求？ |
| --- | --- | --- |
| 作者超过三人时显示前三位加 *et al.* | 通过 `IEEEtranBSTCTL` 强制截断渲染；主 `.bib` 仍保留全部作者 | 否 |
| 渲染结果隐藏 URL、`[Online]` 和 `Available:` | 对本仓库 `IEEEtran.bst` 设置 `CTLuse_url = "no"` | 否 |
| 渲染结果隐藏 DOI | 当前仓库 `IEEEtran.bst` 本身不读取 `doi`；其他样式须另查官方配置 | 否 |
| venue 使用 `Proc. IEEE S&P` 等紧凑直接缩写 | 采用项目维护字典中的 compact 形式 | 否 |

在项目自己的 `.bib` 文件中加入控制条目：

```bibtex
@IEEEtranBSTCTL{IEEEexample:BSTcontrol,
  CTLuse_forced_etal       = {yes},
  CTLmax_names_forced_etal = {3},
  CTLnames_show_etal       = {3},
  CTLuse_url               = {no}
}
```

在 `\begin{document}` 之后、第一次 `\cite` 之前调用：

```tex
\bstctlcite{IEEEexample:BSTcontrol}
```

这段控制只适用于 `IEEEtran` BibTeX 工作流。不要复制到 ACM、LNCS、Elsevier、USENIX 或 Nature/Springer Nature 模板。默认模板不应擅自启用该 profile；是否启用应由具体论文的投稿目标决定。

## 6. 提交前检查

1. 确认主文档使用目标 venue 指定的 class、BST 和编译链，未修改 `packages/publishers/` 中的官方文件。
2. 检查 `.bib` 是否保留完整作者、结构化 `doi`/`url` 字段和准确的出版元数据。
3. 检查标题是否为 sentence case，且仅保护必须保留拼写的 acronym、产品名、系统名和专名。
4. 对照目标 guideline 复核每个期刊和会议缩写；项目字典只能减少重复录入，不能代替核验。
5. 运行 `python scripts/bib_checker.py` 做仓库级字段和宏绑定诊断。该脚本通过不等于出版社合规。
6. 完整编译后检查 `.blg`、`.bbl` 和 PDF，重点查看作者截断、标题大小写、venue、DOI、URL、online 前缀和断行。
7. 若启用了 compact profile，在投稿记录中注明目标 venue、依据和启用项，避免其被误用到其他模板。
