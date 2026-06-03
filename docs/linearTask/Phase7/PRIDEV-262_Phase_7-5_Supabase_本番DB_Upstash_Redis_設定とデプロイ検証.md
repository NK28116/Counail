# PRIDEV-262 - [Phase 7-5] Supabase 本番DB + Upstash Redis 設定とデプロイ検証

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-262` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-262/phase-7-5-supabase-本番db-upstash-redis-設定とデプロイ検証> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-262-phase-7-5-supabase-本番db-upstash-redis-設定とデプロイ検証` |
| Created | 2026-06-01T13:51:26.528Z |
| Updated | 2026-06-01T13:51:26.528Z |

## 内容

## 概要

Supabase 本番DBの運用設定と、Upstash Redis (クラウドネイティブ) の利用を確定させる。

## 実装内容

* Supabase 本番プロジェクト作成
* マイグレーション適用
* Upstash Redis 本番インスタンス作成
* Cloud Run と Upstash / Supabase の接続検証
* 全テストシナリオ Cloud Run 環境で実行

## 受け入れ条件 (DoD)

- [ ] 本番環境ですべてのテストシナリオがパスする
- [ ] Phase 7 の Gate Criteria を満たす

## 関連ドキュメント

* design.md > フェーズ7 > 2. デプロイ (Supabase / Upstash Redis)
* design.md > 3. フェーズ移行基準 > フェーズ7

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
