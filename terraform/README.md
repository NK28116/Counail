# Counail Infrastructure (Terraform)

このディレクトリは Counail のクラウドインフラを Terraform で管理するための雛形です。
将来的な OSS 公開を前提に、利用者が自身の Google Cloud プロジェクトに対して再現性のあるインフラ構築を行えることを目的としています。

> フロントエンド (Next.js) は Vercel にデプロイする想定のため、本ディレクトリでは扱いません。
> このディレクトリでは主にバックエンド (Go / Cloud Run 想定) に関連する基礎リソースのみを定義します。

## 1. 構成ファイル

| ファイル | 役割 |
|---|---|
| `provider.tf` | Terraform / プロバイダのバージョン制約、Google プロバイダ設定 |
| `variables.tf` | プロジェクトID・リージョン・環境などの入力変数定義 |
| `main.tf` | API 有効化、Artifact Registry など主要リソースの定義 |
| `outputs.tf` | 他システムから参照するための出力値 |
| `.gitignore` | `.terraform/` や `*.tfstate`, `*.tfvars` 等の機密・一時ファイル除外 |

## 2. 前提となる CLI ツール

ローカルで本構成を実行するには、以下のツールがインストール済みであることを前提とします。

- [Terraform](https://developer.hashicorp.com/terraform/install) `>= 1.5.0`
- [Google Cloud CLI (`gcloud`)](https://cloud.google.com/sdk/docs/install)

バージョン確認:

```bash
terraform version
gcloud --version
```

## 3. Google Cloud 認証

Terraform は [Application Default Credentials (ADC)](https://cloud.google.com/docs/authentication/application-default-credentials) を利用して Google Cloud にアクセスします。

```bash
gcloud auth login
gcloud auth application-default login
gcloud config set project <YOUR_PROJECT_ID>
```

利用する Google Cloud プロジェクトに対して、最低限以下の権限を持つアカウントで認証してください。

- `roles/serviceusage.serviceUsageAdmin` (API 有効化)
- `roles/artifactregistry.admin` (Artifact Registry 作成)
- `roles/resourcemanager.projectIamAdmin` (任意。IAM を扱う場合)

## 4. 変数の設定

変数は以下のいずれかの方法で渡します。**シークレットを含む `*.tfvars` ファイルは Git に含めないでください** (`.gitignore` で除外済み)。

### 4-1. `terraform.tfvars` を作成する

`terraform/` 直下に `terraform.tfvars` を作成し、以下のように記述します。

```hcl
project_id  = "your-gcp-project-id"
region      = "asia-northeast1"
environment = "dev"
```

### 4-2. 環境変数で渡す

```bash
export TF_VAR_project_id="your-gcp-project-id"
export TF_VAR_region="asia-northeast1"
export TF_VAR_environment="dev"
```

### 4-3. コマンドラインで渡す

```bash
terraform plan -var="project_id=your-gcp-project-id"
```

| 変数名 | 必須 | デフォルト | 説明 |
|---|:---:|---|---|
| `project_id` | ✅ | — | デプロイ対象の GCP プロジェクトID |
| `region` |  | `asia-northeast1` | リージョン |
| `environment` |  | `dev` | 環境識別子 (ラベルに利用) |
| `artifact_registry_repository_id` |  | `counail-backend` | バックエンドコンテナを保存するリポジトリID |
| `enabled_services` |  | Cloud Run / Artifact Registry / Secret Manager 等 | 有効化する Google Cloud API のリスト |

## 5. 実行手順

```bash
cd terraform

# 1) 初期化 (プロバイダプラグインのダウンロード)
terraform init

# 2) 構文チェック / フォーマット
terraform fmt -check
terraform validate

# 3) 変更内容のプレビュー
terraform plan

# 4) 適用
terraform apply
```

`terraform apply` は変更内容を確認するプロンプトを表示します。内容を確認の上、`yes` を入力してください。

## 6. リソース破棄

開発環境を片付ける場合:

```bash
terraform destroy
```

> 注意: API の有効化リソース (`google_project_service`) は `disable_on_destroy = false` を指定しているため、`destroy` 実行時に API が無効化されることはありません。共有プロジェクト上で他のサービスを巻き込まないための安全策です。

## 7. State の取り扱いについて

- 本リポジトリではローカル state (`terraform.tfstate`) を前提としています。
- `.tfstate` には作成済みリソースのメタデータが平文で含まれることがあるため、**絶対にコミットしないでください** (`.gitignore` で除外済み)。
- 本番運用では GCS 等のリモートバックエンドへの移行を推奨します (今回は雛形のためスコープ外)。

## 8. 今後の拡張ポイント

現状は OSS 雛形として最小構成 (API 有効化 + Artifact Registry) のみを管理しています。今後のフェーズで以下を追加することを想定しています。

- バックエンド用 Cloud Run サービス定義
- Secret Manager によるシークレット管理 (DB 接続情報、外部 API キー等)
- Cloud SQL / Memorystore (Redis) 等の永続レイヤ
- IAM ロール / サービスアカウントの最小権限定義
