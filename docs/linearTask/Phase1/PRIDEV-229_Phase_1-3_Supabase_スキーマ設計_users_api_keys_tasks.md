# PRIDEV-229 - [Phase 1-3] Supabase スキーマ設計 (users / api_keys / tasks)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-229` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-263 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-229/phase-1-3-supabase-スキーマ設計-users-api-keys-tasks> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-229-phase-1-3-supabase-スキーマ設計-users-api_keys-tasks` |
| Created | 2026-06-01T13:46:54.983Z |
| Updated | 2026-06-02T00:37:08.201Z |

## 内容

## 概要

Supabase (PostgreSQL) 上に基本3テーブルを定義する。

## ADR: マイグレーションツールの選定

* **Title:** データベースマイグレーションに goose を採用する
* **Status:** Accepted
* **Context:** PostgreSQL (Supabase) のスキーマをコードで管理・適用するため、プロジェクトに最適なマイグレーションツールが必要であった。
* **Decision:** **goose を採用する。**
* **メリット (Pros):** 
  * ピュアなSQLによる記述と、Go言語による複雑なデータ移行スクリプトの両方に対応している柔軟性。
  * Go 1.16+ の `embed` 機能を利用してマイグレーション用SQLをバイナリに埋め込めるため、Cloud Run等のコンテナ環境やCI/CDパイプラインから容易かつ安全に実行できる。
  * GORMの `AutoMigrate` 等に頼らず、本番環境でのスキーマ変更（カラム削除や制約追加など）を確実なバージョン管理下で安全に行える。
* **デメリット (Cons):** 
  * `supabase CLI` 独自のマイグレーション機能（プラットフォーム特化の機能）ではなく、汎用的なPostgreSQLマイグレーションとして扱うことになる。しかし、バックエンド（Go）リポジトリ内でアプリケーションライフサイクルと一体化して管理するメリットの方が大きいため、これを許容する。

## 実装内容

* `users` テーブル: ユーザー情報および設定 (id, email, settings JSONB, created_at, updated_at)
* `api_keys` テーブル: 暗号化されたBYOKキー (id, user_id, provider, encrypted_key, key_hint, created_at)
* `tasks` テーブル: Task情報 (id, user_id, goal_type, status, prompt, created_at, updated_at)
* ~~マイグレーションファイル作成 (supabase CLI 推奨)~~ **goose を用いたマイグレーション管理およびファイル作成**
* RLS (Row Level Security) の初期ポリシー設定

## 受け入れ条件 (DoD)

- [ ] マイグレーションが Supabase 上で適用される
- [ ] Supabase Studio で3テーブルが確認できる
- [ ] RLSが有効化され、認証ユーザーのみ自データにアクセス可

## 関連ドキュメント

* design.md > フェーズ1 > 2. データベース（Supabase/PostgreSQL）スキーマ設計

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
