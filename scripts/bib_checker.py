#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
=============================================================================
Academic BibTeX Verification & Diagnostics Tool
-----------------------------------------------------------------------------
功能：
1. 校验 bib/refer.bib 中文献字段完整性 (author, title, journal/booktitle, year)
2. 检测期刊/会议名称是否使用了 journal_abrv.bib / journal_full.bib 的宏定义
3. 统计文献类型与出版商分布
=============================================================================
"""

import re
import os
import sys

def parse_bib_macros(macro_file):
    macros = set()
    if not os.path.exists(macro_file):
        return macros
    with open(macro_file, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            m = re.match(r'@string\s*\{\s*([a-zA-Z0-9_\-]+)\s*=', line, re.IGNORECASE)
            if m:
                macros.add(m.group(1).lower())
    return macros

def check_refer_bib(refer_path, abrv_path, full_path):
    print("=" * 60)
    print(" 📚 正在执行学术文献数据库 (BibTeX) 规范性诊断...")
    print("=" * 60)

    abrv_macros = parse_bib_macros(abrv_path)
    full_macros = parse_bib_macros(full_path)
    all_macros = abrv_macros | full_macros

    print(f"[*] 发现已收录期刊/会议标准宏: {len(all_macros)} 个")

    if not os.path.exists(refer_path):
        print(f"[!] 错误: 未找到文献库 {refer_path}")
        return

    with open(refer_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    # 提取文献条目
    entry_pattern = re.compile(r'@(\w+)\s*\{\s*([^,]+),([\s\S]*?)(?=\n@|\Z)', re.MULTILINE)
    entries = entry_pattern.findall(content)

    print(f"[*] 解析到文献总数: {len(entries)} 篇\n")

    valid_count = 0
    macro_used_count = 0

    for entry_type, cite_key, body in entries:
        entry_type_lower = entry_type.lower()
        if entry_type_lower == 'string' or entry_type_lower == 'comment':
            continue

        print(f"📄 [{entry_type.upper()}] Citation Key: {cite_key.strip()}")

        # 检查必填项
        has_author = bool(re.search(r'\bauthor\s*=', body, re.I))
        has_title = bool(re.search(r'\btitle\s*=', body, re.I))
        has_year = bool(re.search(r'\byear\s*=', body, re.I))
        has_venue = bool(re.search(r'\b(journal|booktitle)\s*=', body, re.I))

        status = "✅ 完整"
        issues = []
        if not has_author: issues.append("缺失 author")
        if not has_title: issues.append("缺失 title")
        if not has_year: issues.append("缺失 year")
        if not has_venue: issues.append("缺失 journal/booktitle")

        # 检查是否使用宏
        venue_match = re.search(r'\b(journal|booktitle)\s*=\s*([a-zA-Z0-9_\-]+)\s*[,}\n]', body)
        if venue_match:
            macro_name = venue_match.group(2).lower()
            if macro_name in all_macros:
                print(f"    ✨ 成功绑定标准字典宏: {venue_name_str(macro_name)}")
                macro_used_count += 1
            else:
                print(f"    ⚠️  未识别的字典宏: {macro_name}")
        else:
            # 可能是硬编码了字符串
            raw_venue = re.search(r'\b(journal|booktitle)\s*=\s*[\{"]([^\"\}]+)[\}"]', body)
            if raw_venue:
                print(f"    💡 建议: 检测到硬编码期刊名 \"{raw_venue.group(2)[:30]}...\"，建议替换为宏常量以支持全称/缩写一键切换")

        if issues:
            print(f"    ❌ 存在问题: {', '.join(issues)}")
        else:
            valid_count += 1

    print("\n" + "=" * 60)
    print(f"🎉 诊断完成: {valid_count}/{len(entries)} 篇文献字段完整，{macro_used_count} 篇文献已接入标准宏字典！")
    print("=" * 60)

def venue_name_str(macro_name):
    return macro_name.upper()

if __name__ == '__main__':
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) if '__file__' in locals() else os.getcwd()
    refer_p = os.path.join(base_dir, 'bib', 'refer.bib')
    abrv_p = os.path.join(base_dir, 'bib', 'journal_abrv.bib')
    full_p = os.path.join(base_dir, 'bib', 'journal_full.bib')
    check_refer_bib(refer_p, abrv_p, full_p)
