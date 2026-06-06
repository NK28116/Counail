# PRIDEV-224 - [Phase 1-1] Next.js プロジェクト初期化 (App Router + TypeScript + TailwindCSS)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-224` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | PRIDEV-263 |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-224/phase-1-1-nextjs-プロジェクト初期化-app-router-typescript-tailwindcss> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-224-phase-1-1-nextjs-プロジェクト初期化-app-router-typescript` |
| Created | 2026-06-01T13:45:45.483Z |
| Updated | 2026-06-02T00:18:54.081Z |

## 内容

## 概要

`npx create-next-app` を用いて Next.js プロジェクトを初期化する。

## 実装内容

* App Router 構成を採用
* TypeScript 有効化
* TailwindCSS の組み込み
* ESLint / Prettier の初期設定
* 推奨ディレクトリ構成 (`src/app`, `src/features`, `src/shared`) のひな型作成

## 受け入れ条件 (DoD)

- [ ] `npm run dev` でローカル起動できる
- [ ] TailwindCSS が動作する (デフォルトページにユーティリティクラスが反映される)
- [ ] TypeScript型チェックがパスする
- [ ] ディレクトリ構成が CLAUDE.md のフロントエンド構成ルールに準拠

## 関連ドキュメント

* design.md > フェーズ1 > 1. プロジェクト初期化
* CLAUDE.md > フロントエンド構成ルール

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
