# システムアーキテクチャ概要 (System Architecture) - Counail

本ドキュメントは、マルチエージェント合意形成プラットフォーム「Counail」の全体アーキテクチャおよび技術スタックを記述したシステム解説書（README）である。

---

## 1. プロジェクト概要
**Counail** は、複数の異なるLLMサービス（エージェント）を組み合わせ、AI同士の討論（Debate）、相互レビュー（Review）、および合意形成（Consensus）を通じて、高品質な成果物を生成する **Multi-Agent Consensus Platform** である。

人間が最終決定権を持つ **Human-in-the-loop** 型のフローを採用し、AIのハルシネーション抑制、セキュリティ脆弱性の検証、および指定された生成境界（Goal Boundary）の厳守を実現する。

---

## 2. 全体システム構成図 (Architecture Diagram)

システムは、クライアントUI、APIゲートウェイ、非同期ジョブキュー、バックグラウンドワーカー、およびデータストアから構成される疎結合なマイクロサービス風アーキテクチャを採用している。

```mermaid
graph TB
    subgraph Client [クライアント領域]
        UI["Web UI (Next.js App Router)"]
    end

    subgraph AuthProvider [認証サービス]
        Auth["Clerk / Firebase Auth"]
    end

    subgraph Backend [バックエンド領域 (Go)]
        API["API Server (REST API)"]
        Worker["Job Worker (Asynq)"]
    end

    subgraph DataStore [データストア領域]
        DB["Supabase (PostgreSQL / pgvector)"]
        Cache["Redis (Queue & Cache)"]
    end

    subgraph LLM_Cloud [外部LLMプロバイダー]
        OpenRouter["OpenRouter (API)"]
        Gemini["Gemini API"]
        Ollama["Ollama (Local LLM)"]
    end

    %% 接続関係
    UI <-->|HTTPS / Session| API
    UI <-->|Auth Auth0/Clerk| Auth
    API <-->|SQL / Vector| DB
    API -->|Enqueue Task| Cache
    Cache <-->|Dequeue / Heartbeat| Worker
    Worker <-->|SQL / Vector| DB
    Worker -->|Execute Debate / Stream| LLM_Cloud
```

---

## 3. 各コンポーネントの役割

### 3-1. フロントエンド (Web UI)
- **Next.js** を用いて実装され、ユーザーがTaskを作成し、進捗や討論履歴を視覚的に追跡できるUIを提供する。
- 各エージェントの発言タイムラインや、合意・対立軸をビジュアル表示する「論点グラフ (Issue Graph)」を描画する。
- ユーザー自身のAPIキーを登録・管理するBYOK設定画面を持つ。

### 3-2. バックエンド API (Go)
- ユーザー認証、セッション管理、Task作成受付、および過去の履歴検索を行うRESTful APIサーバー。
- 長時間実行される討論ジョブを同期的に待機せず、即座に **202 Accepted** とジョブIDをクライアントに返却し、Redisキューへジョブを投入する。

### 3-3. ジョブワーカー (Go Worker)
- **Redis Queue** から討論ジョブを順次取り出し、バックグラウンドでマルチエージェント討論プロセスを管理・実行する。
- 並列実行制御、APIタイムアウト時の自動リトライ、およびプロバイダーの動的フォールバックを担う。
- 討論の結果（合意、不一致、未決）を構造化し、データベースを更新する。

### 3-4. データストア (Supabase & Redis)
- **Supabase (PostgreSQL)**: リレーショナルデータ（ユーザー、Task、討論履歴）の永続化、および pgvector を用いた過去ログのベクトル検索の実行。
- **Redis**: 非同期ジョブの管理（Asynq 用）、および一時的なAPIコールの結果キャッシュ。

---

## 4. 技術スタック (Technology Stack)

| レイヤー | 技術 / ライブラリ | 採用理由 |
|---|---|---|
| **Frontend** | Next.js, TypeScript, TailwindCSS, Mermaid.js | 堅牢なSPA/SSR構築、迅速なプロトタイプ開発、議論プロセスの可視化。 |
| **Backend** | Go (Go-Fiber/Gin) | 高速な並列実行（Goroutine）制御、省メモリ、型安全性の確保。 |
| **Queue** | Redis, Asynq (Go) | 高信頼かつ高速な非同期ジョブキューの実現、リトライ制御の容易性。 |
| **Database** | Supabase (PostgreSQL + pgvector) | リレーショナル構造と、過去の類似討論を検索するためのベクトル機能の統合。 |
| **Authentication** | Clerk (または Firebase Auth) | 自前認証を排除した強固なセッション管理と迅速な実装。 |
| **LLM Gateway** | OpenRouter SDK, Ollama | 多様なパブリックLLMとローカルLLMへの接続インターフェースの統合。 |
| **Deployment** | Docker, Google Cloud Run | コンテナによる環境の完全同一化と、負荷に応じた自動スケーリング。 |

---

## 5. 主要なディレクトリ構成 (Directory Structure)

```text
counail/
├── .github/                # CI/CD (GitHub Actions) の定義
├── docs/                   # 仕様書・設計書等のドキュメント類
│   ├── requirements.md     # ユーザー要望
│   ├── specification.md    # 要件定義書
│   ├── design.md           # 実装方針および詳細設計
│   ├── architecture.md     # システムアーキテクチャ概要 (本作)
│   ├── workflow.md         # AI開発プロセスワークフロー
│   └── task-to-claude.md   # 実装委譲用指示書
├── prompts/                # 各AIエージェントへの指示プロンプト
│   ├── gemini/             # Gemini 向け（設計・レビュー等）
│   └── claude/             # Claude 向け（実装・タスク作成等）
└── mcp/                    # MCP (Model Context Protocol) 関連設定
```
*※バックエンドおよびフロントエンドの実際のソースコードは、フェーズ1の開発環境構築以降、本ディレクトリ直下に配置されます。*
