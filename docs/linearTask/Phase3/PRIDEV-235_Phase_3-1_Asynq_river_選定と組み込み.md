# PRIDEV-235 - [Phase 3-1] Asynq/river 選定と組み込み

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-235` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-235/phase-3-1-asynqriver-選定と組み込み> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-235-phase-3-1-asynqriver-選定と組み込み` |
| Created | 2026-06-01T13:47:42.805Z |
| Updated | 2026-06-01T13:47:42.805Z |

## 内容

## 概要

Redis と Go の非同期ジョブライブラリ (`Asynq` または `river`) を選定し、プロジェクトに組み込む。

## 実装内容

* ライブラリ選定の理由を ADR として記録
* 依存追加と最小構成の起動 (`cmd/worker/main.go` 雛形)
* Redis接続設定

## 受け入れ条件 (DoD)

- [ ] Worker プロセスが起動する
- [ ] Redis に接続できる
- [ ] 選定理由のドキュメントがある

## 関連ドキュメント

* design.md > フェーズ3 > 1. キュー・ワーカー構造の設計

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
