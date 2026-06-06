# 変更ログ (Change Log)

## Phase 1: 開発環境構築と基盤設計 (完了: Phase 1 全フェーズ)

### 概要
ポートフォリオおよび技術発信向けに、バックエンド(Go)とフロントエンド(Next.js)の基盤構築、データベースおよびRedisのセットアップ、両者間の疎通確認、さらには自動テスト(CI)とコンテナ化(Docker)までを完了させました。これにより、本格的な機能開発に入る前の盤石な土台が完成しています。

### 詳細（実装内容）

1. **Next.js フロントエンド基盤構築 (Phase 1-1)**
   - Next.js (App Router) + TypeScript 環境の初期化。
   - `shared/api/client.ts` による型安全なAPIクライアントの構築。空文字や末尾スラッシュに対する安全なURL正規化（フォールバック）ロジックを実装。

2. **Go バックエンド基盤構築 (Phase 1-2)**
   - Go 1.25.7 と Gin を用いた軽量かつ高速なAPIサーバーの基盤構築。
   - `envconfig` を利用した型安全な環境変数読み込みと、不要な空白を除去する堅牢なCORS設定(`gin-contrib/cors`)の導入。

3. **データベース基盤＆マイグレーション (Phase 1-3 & Phase 1-4)**
   - Supabase (PostgreSQL) に対するテーブル設計。
   - `goose` を用いたマイグレーション管理の導入。ユーザー、APIキー、タスク、およびディベート機能（`debate_sessions`, `consensus_results` 等）のスキーマ定義。
   - `consensus_results` テーブルに対する `session_id` のユニーク制約など、データ整合性を担保する設計。

4. **KVS (Redis) 環境構築 (Phase 1-5)**
   - `docker-compose` を用いたローカルRedis環境の構築。
   - Goの `go-redis` クライアントを用いた薄いラッパー層の実装と、Pingによる接続検証。

5. **Next.js <=> Go 疎通確認 (Phase 1-6)**
   - フロントエンドからバックエンドAPI (`/api/v1/ping`) へのCORSを越えた通信処理を実装。
   - 疎通確認用のページ（`/api-check`）を作成し、ローカル環境でフロントエンドとバックエンドが正しく連動することを確認。

6. **自動テスト(CI)とコンテナ化 (Phase 1-7)**
   - GitHub Actions を用いて、フロントエンド・バックエンドそれぞれ独立した自動Lint＆テストのCIパイプラインを構築（デグレの自動検知）。
   - 本番デプロイ（Cloud Run等）を見据え、バックエンドGoアプリの軽量・セキュアなマルチステージ `Dockerfile` を作成。あわせて既存のフォーマット違反(`gofmt`)もCIに合わせて修正。

---

### ユーザー確認手順（動作確認方法）

面接時のデモやブログのスクリーンショット用に、以下の手順でシステムが正しく稼働していることを確認できます。

#### 1. バックエンド・インフラの起動
1. **Redisの起動**: プロジェクトルートで `docker compose up -d redis` を実行します。
2. **Goサーバーの起動**:
   ```bash
   cd backend
   go run cmd/server/main.go
   ```
   *=> `8080` ポートでサーバーが立ち上がり、Redisへの接続成功とAPIルート（`/api/v1/ping` 等）の登録ログが出力されます。*

#### 2. フロントエンドの起動と疎通確認
1. **Next.jsの起動**: 別ターミナルを開き、フロントエンドを起動します。
   ```bash
   cd frontend
   npm run dev
   ```
2. **ブラウザでの確認**:
   - `http://localhost:3000/api-check` にアクセスします。
   - 画面上に「**Backend reachable, service: counail-backend, message: pong**」と表示されれば、Next.jsからGoバックエンドへのCORS通信が正常に機能しています。

#### 3. データベースマイグレーションの確認
- `backend/internal/db/migrations` ディレクトリにSQLファイル群が生成されていることを確認します。このファイル群を提示することで、宣言的スキーマ管理（DB Schema as Code）を実践していることのアピールになります。

#### 4. CIパイプラインとDockerの確認
1. **GitHub Actions の確認**: GitHub リポジトリの `Actions` タブを開き、Push時やPR時にフロントエンド・バックエンドのCIが緑色（Success）になっているスクリーンショットを撮ります。「継続的インテグレーションによる品質保証の自動化」として強力なアピールになります。
2. **Docker ビルドの確認**:
   ```bash
   cd backend
   docker build -t counail-backend .
   ```
   *=> エラーなくビルドが完了することを確認します。*
