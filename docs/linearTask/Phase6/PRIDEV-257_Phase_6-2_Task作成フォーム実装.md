# PRIDEV-257 - [Phase 6-2] Task作成フォーム実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-257` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-257/phase-6-2-task作成フォーム実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-257-phase-6-2-task作成フォーム実装` |
| Created | 2026-06-01T13:50:47.362Z |
| Updated | 2026-06-01T13:50:47.362Z |

## 内容

## 概要

Task本文、Goal Type、バジェット、優先エージェントを選択するフォームを実装する。

## 実装内容

* `src/features/task-create/` 配下にコンポーネント実装
* フォームバリデーション (zod 等)
* Goal Type選択UI
* 予算 (Token Budget) 入力UI
* 優先エージェント選択UI (Agent候補のフェッチ)

## 受け入れ条件 (DoD)

- [ ] 全項目が入力できる
- [ ] バリデーションエラーが表示される
- [ ] 送信後に Task が作成され、Task詳細画面に遷移する

## 関連ドキュメント

* design.md > フェーズ6 > 1. 主要画面の実装 (Task作成フォーム)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
