# PRIDEV-245 - [Phase 5-1] 事前トークン数算出ロジック実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-245` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-245/phase-5-1-事前トークン数算出ロジック実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-245-phase-5-1-事前トークン数算出ロジック実装` |
| Created | 2026-06-01T13:49:02.116Z |
| Updated | 2026-06-01T13:49:02.116Z |

## 内容

## 概要

送信前にプロンプトのトークン数を算出し、Token Budget を超えないか確認する。

## 実装内容

* tiktoken / vendor別 tokenizer の組み込み (例: tiktoken-go)
* プロンプト + 推定最大出力トークン数 の算出
* Budget値との比較ロジック

## 受け入れ条件 (DoD)

- [ ] OpenAI/Gemini それぞれのモデルでトークン数算出ができる
- [ ] 単体テストでサンプル文字列のトークン数を検証

## 関連ドキュメント

* design.md > フェーズ5 > 1. 事前予測ロジック

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
