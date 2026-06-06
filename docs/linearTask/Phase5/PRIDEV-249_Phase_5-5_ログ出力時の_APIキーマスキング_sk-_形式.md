# PRIDEV-249 - [Phase 5-5] ログ出力時の APIキーマスキング (sk-...形式)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-249` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-249/phase-5-5-ログ出力時の-apiキーマスキング-sk-形式> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-249-phase-5-5-ログ出力時の-apiキーマスキング-sk-形式` |
| Created | 2026-06-01T13:49:35.156Z |
| Updated | 2026-06-01T13:49:35.156Z |

## 内容

## 概要

ログ出力時にAPIキーを `sk-...` 形式でマスキングする。

## 実装内容

* ログ前処理用 sanitizer 実装 (正規表現または構造化ロガーのHook)
* マスキングテストケース

## 受け入れ条件 (DoD)

- [ ] 平文キーがログに出力されないこと
- [ ] テストでマスキング動作を検証

## 関連ドキュメント

* design.md > フェーズ5 > 2. BYOKの暗号化

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
