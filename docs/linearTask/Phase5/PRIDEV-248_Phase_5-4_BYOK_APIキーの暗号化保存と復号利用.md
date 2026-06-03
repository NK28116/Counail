# PRIDEV-248 - [Phase 5-4] BYOK APIキーの暗号化保存と復号利用

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-248` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-248/phase-5-4-byok-apiキーの暗号化保存と復号利用> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-248-phase-5-4-byok-apiキーの暗号化保存と復号利用` |
| Created | 2026-06-01T13:49:23.948Z |
| Updated | 2026-06-01T13:49:23.948Z |

## 内容

## 概要

ユーザー登録のAPIキーを暗号化してDBに保存し、利用時のみ復号する。

## 実装内容

* APIキー登録エンドポイント実装 (`POST /api/v1/api-keys`)
* 暗号化して `api_keys` テーブルに保存
* LLM呼び出し時のみメモリ内復号
* 復号キーの即時破棄 (defer zeroing)

## 受け入れ条件 (DoD)

- [ ] 平文がDBに保存されないこと
- [ ] 利用時に復号して正常にAPIコールできる
- [ ] Phase 5 の Gate Criteria を満たす

## 関連ドキュメント

* design.md > フェーズ5 > 2. BYOKの暗号化

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
