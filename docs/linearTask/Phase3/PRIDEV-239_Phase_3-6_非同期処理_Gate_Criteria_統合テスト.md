# PRIDEV-239 - [Phase 3-6] 非同期処理 Gate Criteria 統合テスト

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-239` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-239/phase-3-6-非同期処理-gate-criteria-統合テスト> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-239-phase-3-6-非同期処理-gate-criteria-統合テスト` |
| Created | 2026-06-01T13:48:10.391Z |
| Updated | 2026-06-01T13:48:10.391Z |

## 内容

## 概要

Phase 3 の Gate Criteria 達成のため、長時間ジョブの非同期処理テストを実装する。

## 実装内容

* 長時間 (例: sleep 10秒) のテスト用ジョブを Redis に投入
* Workerが非同期で完了させて DB を更新することを確認
* 統合テスト `tests/integration/queue_test.go` (相当)

## 受け入れ条件 (DoD)

- [ ] テストジョブが完了し、DBに反映される
- [ ] Phase 3 の Gate Criteria を満たす

## 関連ドキュメント

* design.md > 3. フェーズ移行基準 > フェーズ3

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
