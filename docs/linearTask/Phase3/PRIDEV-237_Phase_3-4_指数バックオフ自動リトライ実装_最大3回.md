# PRIDEV-237 - [Phase 3-4] 指数バックオフ自動リトライ実装 (最大3回)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-237` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-237/phase-3-4-指数バックオフ自動リトライ実装-最大3回> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-237-phase-3-4-指数バックオフ自動リトライ実装-最大3回` |
| Created | 2026-06-01T13:47:58.452Z |
| Updated | 2026-06-01T13:47:58.452Z |

## 内容

## 概要

一時的なAPIエラーに対する自動リトライを実装する。

## 実装内容

* 指数バックオフロジック (例: 1s, 4s, 16s)
* 最大3回のリトライ上限
* リトライ可能エラー / 非可能エラーの分類

## 受け入れ条件 (DoD)

- [ ] 一時エラーで自動リトライされる
- [ ] 3回失敗後、ジョブが DLQ に移される
- [ ] 単体テストでリトライ挙動を検証

## 関連ドキュメント

* design.md > フェーズ3 > 2. エラー処理とDLQ

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
