# Claudeへの指示書: Phase 1-7 IaCの準備

## 1. 概要
本タスクは、将来的なOSSとしての公開を見据え、プロジェクトのインフラストラクチャをコードで管理（IaC: Infrastructure as Code）するための、最低限のTerraform環境を構築することを目的とします。

## 2. 対象フェーズとIssue
- Phase 1-7: IaCの準備
- Linear Issue: PRIDEV-265

## 3. 実装要件（やるべきこと）

### ① Terraform ディレクトリ構成の作成
プロジェクトルートに `terraform/` ディレクトリを作成し、OSS公開に向けたベストプラクティスに沿ったファイル構成を用意してください。
- `provider.tf`: プロバイダー（主にGCP）の定義
- `variables.tf`: プロジェクトIDやリージョンなどの変数定義（ハードコードを避ける）
- `main.tf`: 主要なリソース定義の起点
- `outputs.tf`: 出力変数の定義
- `.gitignore`: Terraform用の設定（`.terraform/` や `*.tfstate`, `.tfvars` など、Gitに含めるべきでないファイルを除外）

### ② 最低限のインフラリソースの定義
今回は「準備」段階のため複雑な構成は避け、アーキテクチャ設計（Go + Cloud Run等）に基づき、今後の拡張のベースとなる基礎リソースを定義してください。
- Google Cloud API の有効化設定（Cloud Run API, Artifact Registry API, Secret Manager API など）
- Artifact Registry のリポジトリ定義（バックエンドコンテナイメージ保存用）
- （必要に応じて）バックエンド用の Cloud Run サービスまたはネットワーク関連のプレースホルダー的な定義

※ フロントエンドはVercelへのデプロイを想定しているため、現状Terraform側でのWebホスティング構成は不要です。

### ③ インフラ環境用READMEの作成
OSS公開を見据え、利用者が自身の環境でインフラを構築できるように `terraform/README.md` を作成してください。
- 必要なCLIツール（`gcloud`, `terraform`）の案内
- ローカルでの実行手順（GCP認証、`terraform init`, `terraform plan`, `terraform apply` など）
- 必要な環境変数や変数の設定方法

## 4. 作業完了の定義 (DoD)
1. `terraform/` ディレクトリに必要な `.tf` ファイルおよびディレクトリ専用の `.gitignore` が作成されていること。
2. 構成内容がOSS化を前提とした汎用的な記述（ハードコードの排除）になっていること。
3. 構築手順を記載した `terraform/README.md` が用意されていること。
4. 以上の変更をコミットし、リモートリポジトリへ Push すること。
