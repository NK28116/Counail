# PRIDEV-247 - [Phase 5-3] AES-256-GCM 暗号化ユーティリティ実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-247` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-247/phase-5-3-aes-256-gcm-暗号化ユーティリティ実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-247-phase-5-3-aes-256-gcm-暗号化ユーティリティ実装` |
| Created | 2026-06-01T13:49:16.479Z |
| Updated | 2026-06-01T13:49:16.479Z |

## 内容

## 概要

BYOK APIキーを保護するため、AES-256-GCM 暗号化ユーティリティを実装する。

## 実装内容

* `internal/crypto/aesgcm.go` (相当) 実装
* 暗号化キーの環境変数読み込み (`ENCRYPTION_KEY`)
* ランダム nonce 生成
* Encrypt / Decrypt 関数

## 受け入れ条件 (DoD)

- [ ] 暗号化→復号で元データに戻る
- [ ] 単体テストでラウンドトリップ検証
- [ ] 不正なキーで復号失敗することを検証

## 関連ドキュメント

* design.md > フェーズ5 > 2. BYOKの暗号化

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
