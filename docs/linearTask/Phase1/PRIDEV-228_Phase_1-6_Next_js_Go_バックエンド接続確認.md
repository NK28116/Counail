# PRIDEV-228 - [Phase 1-6] Next.js ⇄ Go バックエンド接続確認

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-228` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-263 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-228/phase-1-6-nextjs-go-バックエンド接続確認> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-228-phase-1-6-nextjs-go-バックエンド接続確認` |
| Created | 2026-06-01T13:46:24.747Z |
| Updated | 2026-06-02T00:38:25.777Z |

## 内容

## 概要

Phase 1 の Gate Criteria である「Next.js/Goの接続確認」を達成する。

## 実装内容

* Goに `GET /api/v1/ping` を実装
* Next.js から fetch して結果表示するページを作成
* CORS設定の追加 (開発環境用)

## 受け入れ条件 (DoD)

- [ ] Next.jsの画面に Go からのレスポンス文字列が表示される
- [ ] CORSエラーが発生しない
- [ ] Phase 1 の Gate Criteria を満たす

## 関連ドキュメント

* design.md > 3. 実装の優先順位と開発フェーズの移行基準 > フェーズ1

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
