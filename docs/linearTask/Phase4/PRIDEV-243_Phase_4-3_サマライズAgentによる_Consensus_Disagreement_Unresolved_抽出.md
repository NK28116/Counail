# PRIDEV-243 - [Phase 4-3] サマライズAgentによる Consensus/Disagreement/Unresolved 抽出

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-243` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-243/phase-4-3-サマライズagentによる-consensusdisagreementunresolved-抽出> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-243-phase-4-3-サマライズagentによる-consensusdisagreementunresolved-抽出` |
| Created | 2026-06-01T13:48:45.350Z |
| Updated | 2026-06-01T13:48:45.350Z |

## 内容

## 概要

レビュー結果をもとに、サマライズ用エージェントを起動して合意/不一致/未決を抽出する。

## 実装内容

* サマライズ専用 system prompt 設計
* レビュー結果の全Agent分を集約してプロンプト化
* 出力スキーマ (Consensus / Disagreement / Unresolved) を JSON Schema で定義
* 結果を `consensus_results` に保存

## 受け入れ条件 (DoD)

- [ ] 3観点の構造化結果が抽出できる
- [ ] DBに保存される
- [ ] JSON Schemaバリデーションがパスする

## 関連ドキュメント

* design.md > フェーズ4 > 3. 合意（Consensus）と不一致（Disagreement）の集計

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
