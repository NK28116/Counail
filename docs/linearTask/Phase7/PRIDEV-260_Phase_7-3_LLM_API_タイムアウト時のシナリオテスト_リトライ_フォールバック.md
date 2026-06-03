# PRIDEV-260 - [Phase 7-3] LLM API タイムアウト時のシナリオテスト (リトライ + フォールバック)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-260` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-260/phase-7-3-llm-api-タイムアウト時のシナリオテスト-リトライ-フォールバック> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-260-phase-7-3-llm-api-タイムアウト時のシナリオテスト-リトライ-フォールバック` |
| Created | 2026-06-01T13:51:09.743Z |
| Updated | 2026-06-01T13:51:09.743Z |

## 内容

## 概要

故意にLLM APIをタイムアウトさせ、リトライおよびフォールバックが正常動作するか検証する。

## 実装内容

* HTTPモックでタイムアウトをシミュレート
* 指数バックオフリトライの動作確認
* リトライ失敗時のDLQ移動確認
* フォールバックProvider切替の確認 (該当する場合)

## 受け入れ条件 (DoD)

- [ ] タイムアウト→リトライ→DLQ移動の挙動を検証
- [ ] テストがCIでパスする

## 関連ドキュメント

* design.md > フェーズ7 > 1. テスト計画 (シナリオテスト)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
