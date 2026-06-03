# 修正方針・教訓ログ

過去のセッションで発生した問題と、そこから得られた運用方針。

---

## 環境・設定関連

### .env / .env.local の混同（web-PJ）
- **問題**: Docker は `.env` を読み、Next.js は `frontend/.env.local` を読む。片方だけ更新して不整合が発生
- **方針**: 環境変数の読み込み元をドキュメントに明記する。変更時は両方確認

### Docker コンテナの再ビルド忘れ（web-PJ）
- **問題**: コード変更後に `docker-compose up` だけ実行し、古いイメージが使われ続けた
- **方針**: コード変更後は `docker-compose up --build` を使う

### ファイルパスの不整合（株価チャート）
- **問題**: 生成側が `data/plots/1mo/` に書き込み、配信側が `data/plots/` を見ていた
- **方針**: ファイル生成と読み取りのパスは定数で一元管理する。パラメータ（period 等）は一箇所で定義

---



## セキュリティ

### アクセストークンのチャット共有
- **問題**: ユーザーがアクセストークンをチャットに貼り付けた
- **方針**: 秘匿情報は設定ファイルに直接入力する。チャットに貼った場合は即 revoke して再発行

---

## AI 運用

### Obsidian + iCloud + Git の共存
- **問題**: iCloud 同期と .git ディレクトリが競合する可能性
- **方針**: `.git.nosync` トリックを使う。`.gitignore` に `.git.nosync/` を追加

### symlink によるドキュメント共有
- **方針**: プロジェクト内の非公開ドキュメントは Obsidian Vault に実体を置き、プロジェクトから symlink で参照する

### Context 肥大化
- **方針**: context ファイルは 300〜800 tokens に抑える。Vault（memory）を丸ごと LLM に注入しない

---

## プロジェクト固有（Counail）

### Goal Boundary の厳守
- Counail の AI エージェントは指定された Goal Type を超える生成を禁止
- 例: blueprint 指定時に実装コードを生成しない

### 不一致の許容
- 各エージェントの意見を無理に統合しない。Disagreement を正常なステータスとして出力する

### トークン爆発の防止
- review ループの上限を設定する（MVP では 1 回）
- cheap model first → 必要に応じてアップグレード
- debate 上限、routing、cache、human approval gate
