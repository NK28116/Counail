# PRIDEV-232 - [Phase 2-4] Ollama クライアント実装 (ローカルLLM検証用)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-232` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-264 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-232/phase-2-4-ollama-クライアント実装-ローカルllm検証用> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-232-phase-2-4-ollama-クライアント実装-ローカルllm検証用` |
| Created | 2026-06-01T13:47:16.540Z |
| Updated | 2026-06-02T00:36:07.454Z |

## 内容

## 概要

ローカルLLM検証用 Ollama 向けクライアントを実装する。

## 実装内容

* `internal/llm/ollama/client.go` 作成
* `LLMProvider` インターフェースを実装
* ローカルHTTPエンドポイント (`http://localhost:11434`) 対応
* コスト=0 のレスポンス生成

## 受け入れ条件 (DoD)

- [ ] ローカル Ollama (例: llama3) に対してテキスト生成が成功する
- [ ] 単体テストがパスする

## 関連ドキュメント

* design.md > フェーズ2 > 2. プロバイダーごとの実装 > Ollama クライアント

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
