# PRIDEV-259 - [Phase 7-2] Redisキュー経由の統合テスト

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-259` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-259/phase-7-2-redisキュー経由の統合テスト> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-259-phase-7-2-redisキュー経由の統合テスト` |
| Created | 2026-06-01T13:51:04.676Z |
| Updated | 2026-06-01T13:51:04.676Z |

## 内容

## 概要

Redisキューを介した非同期ジョブの実行とDBステータス遷移を統合テストする。

## 実装内容

* testcontainers (Redis / Postgres) を用いた統合テスト
* ジョブ投入→処理→DB更新の全フロー検証
* 並列ジョブの安全性テスト

## 受け入れ条件 (DoD)

- [ ] 統合テストがCIでパスする
- [ ] 並列ジョブのデータ整合性が保たれる

## 関連ドキュメント

* design.md > フェーズ7 > 1. テスト計画 (統合テスト)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
