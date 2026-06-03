# PRIDEV-261 - [Phase 7-4] Google Cloud Run デプロイ (API + Worker)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-261` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-261/phase-7-4-google-cloud-run-デプロイ-api-worker> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-261-phase-7-4-google-cloud-run-デプロイ-api-worker` |
| Created | 2026-06-01T13:51:16.021Z |
| Updated | 2026-06-01T13:51:16.021Z |

## 内容

## 概要

バックエンドAPIおよびWorkerをDockerコンテナとしてGoogle Cloud Runへデプロイする。

## 実装内容

* Dockerfile (API/Worker分離)
* Cloud Run サービス定義
* 環境変数の Secret Manager 連携
* CI/CDパイプライン (例: GitHub Actions) 設定

## 受け入れ条件 (DoD)

- [ ] APIサービスがCloud Runで稼働する
- [ ] WorkerサービスがCloud Runで稼働する
- [ ] 環境変数が Secret Manager から注入される

## 関連ドキュメント

* design.md > フェーズ7 > 2. デプロイ (Google Cloud Run)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
