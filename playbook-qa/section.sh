#!/usr/bin/env bash
# Playbook から必要な節だけ取り出す。全文を読まないための道具。
# 使い方: section.sh <playbook-full.md のパス> <何を>
#   index         場面索引の節
#   list          型の見出し一覧（A-1 〜 G-5）
#   A-1 など      その型の項目だけ
#   土台 など     その語で始まる ## 節（土台・はじめに・用語）
set -u
P="$1"; K="$2"
case "$K" in
  index) awk '/^## 場面索引/{f=1} f&&/^## /&&!/場面索引/{exit} f' "$P" ;;
  list)  grep -n "^### [A-G]-[0-9]" "$P" ;;
  [A-G]-[0-9]*) awk -v k="### $K " 'index($0,k)==1{f=1} f&&/^##/&&index($0,k)!=1{exit} f' "$P" ;;
  *) awk -v k="## $K" 'index($0,k)==1{f=1} f&&/^## /&&index($0,k)!=1{exit} f' "$P" ;;
esac
