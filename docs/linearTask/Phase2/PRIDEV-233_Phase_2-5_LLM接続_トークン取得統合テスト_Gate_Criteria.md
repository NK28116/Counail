# PRIDEV-233 - [Phase 2-5] LLM接続・トークン取得統合テスト (Gate Criteria)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-233` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-264 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-233/phase-2-5-llm接続トークン取得統合テスト-gate-criteria> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-233-phase-2-5-llm接続・トークン取得統合テスト-gate-criteria` |
| Created | 2026-06-01T13:47:21.855Z |
| Updated | 2026-06-02T01:01:18.270Z |

## 内容

## 概要

Phase 2 の Gate Criteria 達成のため、OpenRouter/Ollamaの双方に対する接続テストを実装する。

## 実装内容

* OpenRouter と Ollama の双方に対してダミープロンプトを送信するテストケース
* トークン消費数が取得できることを確認
* `tests/integration/llm_test.go` (相当) に統合テスト追加

## 受け入れ条件 (DoD)

- [ ] OpenRouter / Ollama / Gemini それぞれに対しテストがパス
- [ ] Phase 2 の Gate Criteria を満たす

## 関連ドキュメント

* design.md > 3. フェーズ移行基準 > フェーズ2

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
