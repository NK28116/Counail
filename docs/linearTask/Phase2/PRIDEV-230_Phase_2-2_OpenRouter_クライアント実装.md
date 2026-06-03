# PRIDEV-230 - [Phase 2-2] OpenRouter クライアント実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-230` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-264 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-230/phase-2-2-openrouter-クライアント実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-230-phase-2-2-openrouter-クライアント実装` |
| Created | 2026-06-01T13:47:04.599Z |
| Updated | 2026-06-02T00:35:44.876Z |

## 内容

## 概要

OpenRouter API を経由した LLM 呼び出しアダプターを実装する。

## 実装内容

* `internal/llm/openrouter/client.go` 作成
* `LLMProvider` インターフェースを実装
* リクエスト/レスポンスマッピング
* ストリーミング (SSE) 対応
* レート制限とエラー型のマッピング

## 受け入れ条件 (DoD)

- [ ] ダミープロンプトでテキスト生成が成功する
- [ ] トークン消費数が `GenerateResponse` に正しく反映される
- [ ] 単体テスト (HTTPモック使用) がパスする

## 関連ドキュメント

* design.md > フェーズ2 > 2. プロバイダーごとの実装 > OpenRouter クライアント

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
