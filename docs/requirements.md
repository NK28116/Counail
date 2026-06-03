# 要望

## 概要

複数のLLMサービスを利用し、AI同士が:

- 調査
- 回答
- 相互レビュー
- 合意形成

を行い、人間主導で最終成果物を生成するサービス「Counail」を実装する。

本サービスは単一AIチャットではなく:

> Multi-Agent Consensus Platform

として設計する。

---

# 対象

## MVP対象

- Web版
- 2〜3LLM対応
- requirement / blueprint / review用途
- 人間承認型フロー

---

# 用語定義

| 用語 | 意味 |
|---|---|
| Task | ユーザー依頼 |
| Agent | LLM人格単位 |
| Team | Agent集合 |
| Consensus | 合意結果 |
| Disagreement | 不一致意見 |
| Review | 相互検証 |
| Goal Type | 成果物粒度 |
| Blueprint | 骨組み |
| Design | 詳細設計 |

---

# 機能要件

## 1. Task作成

### 1-1. Task入力

ユーザーは以下を入力可能。

- task本文
- Goal Type
- 深度
- 制約
- token budget
- review回数

---

### 1-2. Goal Type

以下を最低限サポート。

| Type | 内容 |
|---|---|
| answer | 回答 |
| summary | 要約 |
| instruction | 指示書 |
| requirement | requirement.md |
| sketch | ラフ |
| blueprint | 骨組み |
| design | 詳細設計 |

---

### 1-3. Goal Boundary

Goal Type外の過剰生成禁止。

例:
- blueprintで詳細実装生成禁止
- sketchで設計詳細化禁止

---

## 2. Multi-Agent実行

### 2-1. LLM Provider

最低限以下に対応。

- OpenAI
- Anthropic
- Gemini
- OpenRouter
- LocalLLM

---

### 2-2. 共通Interface

Provider差異を吸収する共通interfaceを持つ。

最低:
- generate
- stream
- token usage
- cost
- timeout
- cancellation

---

### 2-3. 並列実行

複数Agentは並列実行。

---

### 2-4. retry

必要:
- timeout retry
- provider fallback
- partial failure handling

---

## 3. Debate System

### 3-1. 初回独立回答

初回回答時:
他Agent出力参照禁止。

---

### 3-2. Review

Agent同士で以下をレビュー。

- hallucination
- 要件漏れ
- セキュリティ
- コスト
- 過剰実装

---

### 3-3. Consensus

最終結果として:
- consensus
- disagreement
- unresolved issue
を生成。

---

### 3-4. disagreement保持

無理に一致させない。

---

## 4. Team System

### 4-1. Team構造

AgentをTeam管理可能。

例:

Claude Team:
- coder
- QA
- security

Gemini Team:
- researcher

---

### 4-2. Dynamic Routing

Task内容に応じ必要Agentのみ呼び出す。

不要Agent起動禁止。

---

### 4-3. escalation

問題検知時のみ専門Agent追加。

例:
- security issue
- billing issue

---

## 5. Token/Budget管理

### 5-1. token予測

実行前に:
- input token
- output token
- context残量
を推定。

---

### 5-2. token不足停止

不足見込み時:
- review停止
- consensus停止
- debate停止

---

### 5-3. waiting状態

以下状態を持つ。

- waiting_context_reset
- waiting_budget_reset

---

### 5-4. summary compression

長文履歴は:
- summary
- issue extraction
- pruning
を行う。

履歴自体は保持。

---

## 6. BYOK

### 6-1. User API Key

ユーザー自身のAPI Key登録可能。

対象:
- OpenAI
- Anthropic
- Gemini
- OpenRouter

---

### 6-2. Key保護

必須:
- server-side encryption
- masking
- rotation

平文保存禁止。

---

### 6-3. Key Scope

Keyごとに:
- allowed models
- budget
- usage limit
を設定可能。

---

## 7. 出力

### 7-1. 最終成果物

以下を返却。

- consensus
- disagreement
- review
- confidence
- token
- cost

---

### 7-2. 議論可視化

閲覧可能:
- review flow
- issue graph
- debate history

---

## 8. 保存

保存対象:
- task
- review
- consensus
- token
- cost
- agent構成

---

## 9. 検索

必要:
- full text search
- embedding search
- tag search

---

## 10. 認証

### 10-1. MVP

外部認証利用。

推奨:
- Clerk
- Auth0
- Firebase Auth

自前Auth禁止。

---

### 10-2. Session管理

必要:
- secure cookie
- refresh
- revoke

---

# 非機能要件

## 1. 可用性

1 Provider障害で全停止しない。

---

## 2. Queue構成

必須:
- Queue
- Worker
- Retry Queue
- DLQ

同期長時間処理禁止。

---

## 3. Observability

必要:
- structured log
- tracing
- token metrics
- latency
- provider error率

---

## 4. Security

### 4-1. Prompt Injection対策

必要:
- role isolation
- instruction filtering
- prompt escaping

---

### 4-2. Workspace Isolation

organizationデータ混在禁止。

---

### 4-3. Secret Detection

以下検知推奨:
- API key
- password
- token

---

### 4-4. ログ保護

必要:
- masking
- PII除去

---

## 5. 無限議論防止

必要:
- max debate count
- stagnation detection
- repeated argument detection

---

## 6. コスト最適化

必要:
- cheap model first
- routing
- cache
- summary compression

---

## 7. implementation制限

MVPでは:
- 完全自動実装
- autonomous agent
- 永続Agent

禁止。

---

# MVP範囲

## 含む

- Web UI
- 2〜3AI
- review1回
- consensus
- disagreement
- token管理
- BYOK

---

## 含まない

- Slack
- Discord
- 音声
- SNS
- autonomous coding
- Team memory
- Enterprise機能

---

# 推奨構成

## Frontend

- Next.js

---

## Backend

- Go or FastAPI

---

## Infra

- Cloud Run
- Supabase(PostgreSQL)
- Redis Queue

---

## LLM

- OpenRouter
- Ollama

---

# 重要事項

## 1. Goal Boundary厳守

AIによる善意スコープ拡張禁止。

---

## 2. disagreement許容

一致しないことを正常扱い。

---

## 3. Human-in-the-loop

最終決定権は人間。

---

## 4. token最適化優先

AI数増加を価値としない。

---

## 5. Security優先

MVPでも:
- API Key
- prompt
- organization data
の漏洩対策必須。

---

# 追記

## 将来拡張予定

- Slack integration
- Organization memory
- Enterprise
- Audit log
- Team workspace
- Advanced routing

ただしMVP実装対象外。
