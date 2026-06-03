# PRIDEV-227 - [Phase 1-5] Redis 環境セットアップ (ローカル + 本番準備)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-227` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-263 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-227/phase-1-5-redis-環境セットアップ-ローカル-本番準備> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-227-phase-1-5-redis-環境セットアップ-ローカル-本番準備` |
| Created | 2026-06-01T13:46:19.264Z |
| Updated | 2026-06-02T00:38:13.772Z |

## 内容

## 概要

ローカル検証用および本番用 Redis インスタンスを準備する。

## 実装内容

* ローカル: docker-compose に Redis サービスを追加
* 本番: Upstash Redis のアカウント/プロジェクト準備 (環境変数のみ記録、実プロビジョニングは Phase 7)
* Goバックエンドから Redis 接続確認スクリプト
* `.env.example` に `REDIS_URL` を追加

## 受け入れ条件 (DoD)

- [ ] `docker compose up redis` で Redis が起動する
- [ ] Goから `PING/PONG` が成功する
- [ ] `.env.example` が更新されている

## 関連ドキュメント

* design.md > フェーズ1 > 3. Redis 環境のセットアップ

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
