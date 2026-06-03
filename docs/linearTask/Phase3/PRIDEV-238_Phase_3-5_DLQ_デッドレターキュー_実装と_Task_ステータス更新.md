# PRIDEV-238 - [Phase 3-5] DLQ (デッドレターキュー) 実装と Task ステータス更新

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-238` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-238/phase-3-5-dlq-デッドレターキュー-実装と-task-ステータス更新> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-238-phase-3-5-dlq-デッドレターキュー-実装と-task-ステータス更新` |
| Created | 2026-06-01T13:48:05.757Z |
| Updated | 2026-06-01T13:48:05.757Z |

## 内容

## 概要

リトライ上限を超えたジョブを DLQ に退避させ、Taskステータスを `failed` に更新する。

## 実装内容

* DLQ キューの定義
* リトライ上限超過時の DLQ 移動ロジック
* Task ステータス `failed` への更新
* DLQ監視用ログ/メトリクス出力

## 受け入れ条件 (DoD)

- [ ] 失敗ジョブが DLQ に移される
- [ ] Task が `failed` ステータスになる
- [ ] DLQから手動再投入が可能

## 関連ドキュメント

* design.md > フェーズ3 > 2. エラー処理とDLQ

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
