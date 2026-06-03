# PRIDEV-241 - [Phase 4-1] 初回独立回答処理の並列実行実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-241` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-241/phase-4-1-初回独立回答処理の並列実行実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-241-phase-4-1-初回独立回答処理の並列実行実装` |
| Created | 2026-06-01T13:48:34.677Z |
| Updated | 2026-06-01T13:48:34.677Z |

## 内容

## 概要

指定された全Agentに対し、並列で同一Taskプロンプトと個別ロール設定を送信し、初期応答を生成する。

## 実装内容

* Agent構成 (`agent_configs`) の取得
* goroutine + errgroup での並列LLM呼び出し
* 初期応答を `debate_messages` に保存 (他Agentの回答は含めない)

## 受け入れ条件 (DoD)

- [ ] 3以上のAgentに対し並列実行される
- [ ] 各Agentの初期応答がDBに保存される
- [ ] 単体テストでモックLLMによる並列実行を確認

## 関連ドキュメント

* design.md > フェーズ4 > 1. 初回独立回答処理

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
