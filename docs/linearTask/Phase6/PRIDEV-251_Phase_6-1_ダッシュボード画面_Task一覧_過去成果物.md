# PRIDEV-251 - [Phase 6-1] ダッシュボード画面 (Task一覧 + 過去成果物)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-251` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-251/phase-6-1-ダッシュボード画面-task一覧-過去成果物> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-251-phase-6-1-ダッシュボード画面-task一覧-過去成果物` |
| Created | 2026-06-01T13:49:51.168Z |
| Updated | 2026-06-01T13:49:51.168Z |

## 内容

## 概要

進行中の Task 一覧および過去の成果物リストを表示するダッシュボードを実装する。

## 実装内容

* `src/app/dashboard/page.tsx` 作成
* Task一覧API (`GET /api/v1/tasks`) との連携
* ステータスフィルタ・並び替え機能
* 完了Task成果物のリンク一覧

## 受け入れ条件 (DoD)

- [ ] Task一覧が表示される
- [ ] ステータス別フィルタが機能する
- [ ] 過去成果物のリンクが機能する

## 関連ドキュメント

* design.md > フェーズ6 > 1. 主要画面の実装 (ダッシュボード)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
