# PRIDEV-236 - [Phase 3-2] Task作成API実装 (POST /api/tasks → ジョブ投入)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-236` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-236/phase-3-2-task作成api実装-post-apitasks-ジョブ投入> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-236-phase-3-2-task作成api実装-post-apitasks-ジョブ投入` |
| Created | 2026-06-01T13:47:50.238Z |
| Updated | 2026-06-01T13:47:50.238Z |

## 内容

## 概要

ユーザーからのTask作成リクエストを受け、Redisキューにジョブを投入する。

## 実装内容

* `POST /api/v1/tasks` エンドポイント実装
* リクエストバリデーション
* Tasksレコード作成 (status: pending)
* Redisキューへのジョブ投入 (Task ID)
* レスポンス: `202 Accepted` + Task ID

## 受け入れ条件 (DoD)

- [ ] APIから Task が作成され、DB に保存される
- [ ] Redisキューにジョブが投入される
- [ ] `202` ステータスと Task ID が返る

## 関連ドキュメント

* design.md > フェーズ3 > 1. キュー・ワーカー構造の設計 (シーケンス図)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
