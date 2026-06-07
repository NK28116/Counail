# PRIDEV-265 Design: Phase 1-7 IaCの準備

## 概要
将来的なOSS（オープンソースソフトウェア）としての公開や、本番環境への再現性のあるデプロイを見据え、インフラストラクチャをコードとして管理（IaC: Infrastructure as Code）するため、Terraformを用いた最低限の基盤構成を準備する。

## 設計方針
- **アーキテクチャ上の位置づけ**:
  - システムインフラ（データベース、バックエンド、フロントエンド等のリソース）の構築を自動化・文書化するインフラ管理レイヤー。モノリポ内に内包し、コードとインフラの設定を連動させる。
- **既存コンポーネントとの関係**:
  - Phase 1で設計・構築されているNext.js（Frontend）、Go（Backend）、Supabase（DB）、Redis等のリソースのプロビジョニング基盤となる。
- **技術選定の理由**:
  - **Terraform**: クラウドプロバイダーに依存しない標準的なIaCツールであり、OSSとして公開した際、利用者が自身の環境（AWS, GCP, Vercel等）へカスタマイズ・適用しやすい汎用性と可読性を持つため。

## 実装詳細
### ファイル構成
モノリポのルートディレクトリ配下に、インフラ管理専用のディレクトリを作成する。

- 新規作成するディレクトリ・ファイル:
  - `terraform/`
    - `main.tf`: プロバイダー設定、および最低限のベースリソース定義
    - `variables.tf`: 環境ごとに変動するパラメータの変数定義
    - `outputs.tf`: 作成されたリソースのエンドポイント等の出力定義
    - `providers.tf`: Terraformのバージョンおよび使用するプロバイダー（Google Cloud, AWS等）の指定
  - プロジェクトルートの `.gitignore`:
    - `.terraform/`, `*.tfstate`, `*.tfstate.backup`, `*.tfvars` 等、Terraform関連の機密・一時ファイルの除外設定を追記。

### 主要な処理フロー
ローカルおよびCI環境において以下のワークフローを想定する。
1. `terraform init`: プラグインのダウンロードおよびバックエンドの初期化。
2. `terraform fmt` / `terraform validate`: コードフォーマットの統一と構文チェック。
3. `terraform plan`: 変更差分の事前確認。
4. `terraform apply`: 実際のリソース構築（OSS利用者が各自で行う想定）。

### データ構造
現段階（最低限のIaC準備）において `variables.tf` に定義する主な変数構造：
- `project_name` (プロジェクト名)
- `environment` (dev / staging / prod 等の環境識別子)
- `region` (デプロイメント対象のリージョン)

## リスク評価
- **技術リスク**: Terraformの状態管理ファイル (`.tfstate`) には、作成されたリソースのメタデータや機密情報（パスワード等）が平文で保存される可能性がある。パブリックリポジトリに誤ってコミットされないよう、`.gitignore` の徹底と、実稼働時はリモートバックエンド（S3, GCS等）の暗号化利用が必要。
- **運用リスク**: OSS化に向けた雛形であるため、特定のクラウドリソースに強く依存しすぎると利用者のハードルが上がる。可能な限り抽象化し、汎用的な設定に留める必要がある。
- **リスクレベル**: Medium

## Linear Task分割案
本要件を Claude（実装AI）に委譲するためのタスク分割（Issue化）案。

1. **[Phase 1-7: Task A] Terraformの初期ディレクトリ構成とベースファイルの作成**
   - `terraform/` ディレクトリと、`main.tf`, `variables.tf`, `outputs.tf`, `providers.tf` の空または最小構成ファイルを作成する。
2. **[Phase 1-7: Task B] `.gitignore`の更新とセキュリティ対策**
   - プロジェクトルートの `.gitignore` を更新し、`.tfstate` や `.tfvars` など、シークレットを含む可能性のあるTerraform自動生成ファイルがGit管理下に入らないように設定する。
3. **[Phase 1-7: Task C] READMEへのIaC利用ガイドラインの追加**
   - OSS利用者が環境を立ち上げる際の `terraform` コマンドライン手順（init, plan, apply 等）をドキュメント化し、`terraform/README.md` を作成する。
