# PRIDEV-231 - [Phase 2-3] Gemini クライアント実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-231` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-264 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-231/phase-2-3-gemini-クライアント実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-231-phase-2-3-gemini-クライアント実装` |
| Created | 2026-06-01T13:47:11.714Z |
| Updated | 2026-06-02T01:01:02.890Z |

## 内容

## 概要

Google Vertex AI / Gemini API 向けの LLM クライアントを実装する。

## 実装内容

* `internal/llm/gemini/client.go` 作成
* `LLMProvider` インターフェースを実装
* 認証 (API key / Service Account) 対応
* トークン計算ロジック (Gemini仕様)

## 受け入れ条件 (DoD)

- [ ] ダミープロンプトでテキスト生成が成功する
- [ ] エラーレスポンスが共通エラー型にマップされる
- [ ] 単体テストがパスする

## 関連ドキュメント

* design.md > フェーズ2 > 2. プロバイダーごとの実装 > Gemini クライアント

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
