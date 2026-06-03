# docs/prompts — プロンプト運用方針・指示集

本ディレクトリは、Counail プロジェクトおよび関連プロジェクトで蓄積された AI 運用の指示・提案・修正方針を集約したものである。

## ディレクトリ構成

| ファイル | 内容 |
|---|---|
| `README.md` | 本ファイル。全体のインデックス |
| `ai-trinity-protocol.md` | 三位一体開発プロトコルの詳細運用ガイド |
| `context-engineering.md` | Context Engineering 方針（LLM への文脈注入設計） |
| `token-efficiency.md` | トークン効率化ルール |
| `prompt-design-principles.md` | プロンプト設計原則（全 AI 共通） |
| `claude-directives.md` | Claude 向け指示・制約・修正方針 |
| `gemini-directives.md` | Gemini 向け指示・制約・修正方針 |
| `chatgpt-directives.md` | ChatGPT 向け指示・役割定義 |
| `correction-log.md` | 過去の修正方針・失敗から学んだ教訓 |

## 参照関係

- 実行用プロンプト本体: `prompts/claude/`, `prompts/gemini/`
- AI 運用ルール概要: `docs/ai-rules.md`
- 開発ワークフロー: `docs/workflow.md`
- コーディング規約: `docs/coding-standards.md`
