# PRIDEV-246 - [Phase 5-2] Token Budget 超過検出と中断・警告処理

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-246` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-246/phase-5-2-token-budget-超過検出と中断警告処理> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-246-phase-5-2-token-budget-超過検出と中断・警告処理` |
| Created | 2026-06-01T13:49:09.244Z |
| Updated | 2026-06-01T13:49:09.244Z |

## 内容

## 概要

Token Budget超過が予測される場合、処理を中断しユーザーへ警告する。

## 実装内容

* Budget超過検出時のエラー型定義
* Worker側で送信前チェック
* API応答での警告メッセージ返却
* Taskステータス更新 (例: `budget_exceeded`)

## 受け入れ条件 (DoD)

- [ ] Budget超過時に処理が中断される
- [ ] ユーザーに警告が表示される

## 関連ドキュメント

* design.md > フェーズ5 > 1. 事前予測ロジック

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
