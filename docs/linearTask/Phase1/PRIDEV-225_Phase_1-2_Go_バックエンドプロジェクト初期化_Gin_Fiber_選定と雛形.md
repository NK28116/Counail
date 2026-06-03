# PRIDEV-225 - [Phase 1-2] Go バックエンドプロジェクト初期化 (Gin/Fiber 選定と雛形)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-225` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-263 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-225/phase-1-2-go-バックエンドプロジェクト初期化-ginfiber-選定と雛形> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-225-phase-1-2-go-バックエンドプロジェクト初期化-ginfiber-選定と雛形` |
| Created | 2026-06-01T13:45:53.865Z |
| Updated | 2026-06-02T00:37:44.691Z |

## 内容

## 概要

Go (Gin または Fiber) を用いてバックエンドプロジェクトを初期化する。

## ADR: Webフレームワークの選定

* **Title:** WebフレームワークにGinを採用する
* **Status:** Accepted
* **Context:** Go言語でのバックエンドAPI開発にあたり、標準`net/http`ベースのGinと、独自エンジン`fasthttp`ベースのFiberが候補に挙がった。
* **Decision:** **Ginを採用する。**
* **Reason:** プロジェクトにおける「汎用性」を最優先するため。GinはGo標準ライブラリ（`net/http`）と完全な互換性があり、Goの巨大なサードパーティ製ミドルウェアやエコシステムをそのまま活用できる。将来的な要件変更や機能拡張にも柔軟かつ安定して対応できる堅牢な基盤と判断した。
* **Consequences:** 
  * (Positive) 豊富なエコシステムの活用により、開発・保守の効率が向上する。
  * (Negative) スループットの極限の最適化においてはFiberに劣るが、本プロジェクトの通常要件においてはGinのパフォーマンスで十分であるため問題としない。

## 実装内容

* ~~Gin / Fiber のいずれかを選定 (理由は ADR として記録)~~ **Ginを選定済み**
* `go mod init` でモジュール初期化
* 基本的なディレクトリ構成 (`cmd/server`, `internal/`, `pkg/`)
* ヘルスチェックエンドポイント `/healthz` の実装
* ロギング・設定読み込み (envconfig 等) の最小実装

## 受け入れ条件 (DoD)

- [ ] `go run ./cmd/server` でサーバが起動する
- [ ] `curl localhost:PORT/healthz` で 200 が返る
- [ ] `go test ./...` がパスする (空でも可)

## 関連ドキュメント

* design.md > フェーズ1 > 1. プロジェクト初期化 (バックエンドはGoを選定)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
