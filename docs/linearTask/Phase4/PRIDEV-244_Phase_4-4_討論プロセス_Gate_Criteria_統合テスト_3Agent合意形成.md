# PRIDEV-244 - [Phase 4-4] 討論プロセス Gate Criteria 統合テスト (3Agent合意形成)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-244` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-244/phase-4-4-討論プロセス-gate-criteria-統合テスト-3agent合意形成> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-244-phase-4-4-討論プロセス-gate-criteria-統合テスト-3agent合意形成` |
| Created | 2026-06-01T13:48:50.057Z |
| Updated | 2026-06-01T13:48:50.057Z |

## 内容

## 概要

Phase 4 の Gate Criteria 達成のため、3台のAgentによる合意形成の統合テストを実装する。

## 実装内容

* 3台の異なるAgent (例: GPT/Claude/Gemini) に同一テーマを与える
* 初回回答→相互レビュー→サマライズの一連を実行
* 出力JSONの構造を検証

## 受け入れ条件 (DoD)

- [ ] 合意/不一致のJSONが正しく生成される
- [ ] Phase 4 の Gate Criteria を満たす

## 関連ドキュメント

* design.md > 3. フェーズ移行基準 > フェーズ4

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
