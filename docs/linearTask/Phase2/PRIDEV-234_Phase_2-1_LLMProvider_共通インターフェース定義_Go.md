# PRIDEV-234 - [Phase 2-1] LLMProvider 共通インターフェース定義 (Go)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-234` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-264 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-234/phase-2-1-llmprovider-共通インターフェース定義-go> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-234-phase-2-1-llmprovider-共通インターフェース定義-go` |
| Created | 2026-06-01T13:47:38.334Z |
| Updated | 2026-06-02T00:29:04.899Z |

## 内容

## 概要

多様なLLMプロバイダーへの要求を統一的に処理するためのインターフェースを定義する。

## 実装内容

* `LLMProvider` インターフェース定義
  * `Generate(ctx, *GenerateRequest) (*GenerateResponse, error)`
  * `Stream(ctx, *GenerateRequest) (<-chan *StreamChunk, error)`
* `GenerateRequest` 構造体: プロンプト、モデル名、システムプロンプト、温度、最大トークン数
* `GenerateResponse` 構造体: 出力テキスト、消費トークン (Input/Output)、推定コスト
* `StreamChunk` 構造体: ストリーミング差分

## 受け入れ条件 (DoD)

- [ ] `internal/llm/provider.go` (相当) にインターフェース定義
- [ ] `go build… (truncated, use `get_issue` for full description)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
