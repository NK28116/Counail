# PRIDEV-250 - [Phase 5-6] プロンプトインジェクション対策 (デリミタ + エスケープ)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-250` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-250/phase-5-6-プロンプトインジェクション対策-デリミタ-エスケープ> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-250-phase-5-6-プロンプトインジェクション対策-デリミタ-エスケープ` |
| Created | 2026-06-01T13:49:38.656Z |
| Updated | 2026-06-01T13:49:38.656Z |

## 内容

## 概要

ユーザー入力がエージェントへのシステム命令を書き換えないように、デリミタとエスケープ処理を実装する。

## 実装内容

* `[USER INPUT START]` / `[USER INPUT END]` デリミタの組み込み
* ユーザー入力内のデリミタトークンのエスケープ処理
* LLMへの入力前の前処理パイプライン

## 受け入れ条件 (DoD)

- [ ] ユーザー入力がデリミタで囲まれる
- [ ] デリミタ衝突攻撃を含むテストケースがパスする

## 関連ドキュメント

* design.md > フェーズ5 > 3. プロンプトインジェクション対策

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
