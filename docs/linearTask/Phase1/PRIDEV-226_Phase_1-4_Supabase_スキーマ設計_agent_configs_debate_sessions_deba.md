# PRIDEV-226 - [Phase 1-4] Supabase スキーマ設計 (agent_configs / debate_sessions / debate_messages / consensus_results)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-226` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-263 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-226/phase-1-4-supabase-スキーマ設計-agent-configs-debate-sessions-debate> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-226-phase-1-4-supabase-スキーマ設計-agent_configs-debate_sessions` |
| Created | 2026-06-01T13:46:05.085Z |
| Updated | 2026-06-02T00:37:21.635Z |

## 内容

## 概要

討論セッション関連の4テーブルを定義する。

## 実装内容

* `agent_configs` テーブル: チーム/タスク紐づきのAgent構成 (id, task_id, role, model, system_prompt)
* `debate_sessions` テーブル: 討論セッション履歴 (id, task_id, total_input_tokens, total_output_tokens, total_cost, status)
* `debate_messages` テーブル: Agent発言ログ (id, session_id, agent_id, role, content, review_targets JSONB)
* `consensus_results` テーブル: 合意/不一致/未決 (id, session_id, consensus JSONB, disagreement JSONB, unresolved JSONB)
* 外部… (truncated, use `get_issue` for full description)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
