# PRIDEV-255 - [Phase 6-6] 設定画面 (BYOK登録 / マスキング表示 / 残量制限)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-255` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-255/phase-6-6-設定画面-byok登録-マスキング表示-残量制限> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-255-phase-6-6-設定画面-byok登録-マスキング表示-残量制限` |
| Created | 2026-06-01T13:50:29.564Z |
| Updated | 2026-06-01T13:50:29.564Z |

## 内容

## 概要

APIキー (BYOK) の登録・マスキング表示・残量制限のUIを実装する。

## 実装内容

* `src/app/settings/page.tsx` 作成
* BYOK登録フォーム (Provider選択 + キー入力)
* 登録済みキーの一覧表示 (`sk-...` マスキング)
* 残量制限 (Token Budget) 入力UI
* 削除確認ダイアログ

## 受け入れ条件 (DoD)

- [ ] APIキーが登録できる
- [ ] 一覧でマスキングされて表示される
- [ ] Budget設定が保存される

## 関連ドキュメント

* design.md > フェーズ6 > 1. 主要画面の実装 (設定画面)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
