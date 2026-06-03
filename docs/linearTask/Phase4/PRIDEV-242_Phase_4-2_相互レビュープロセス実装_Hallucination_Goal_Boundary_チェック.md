# PRIDEV-242 - [Phase 4-2] 相互レビュープロセス実装 (Hallucination/Goal Boundary チェック)

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-242` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-242/phase-4-2-相互レビュープロセス実装-hallucinationgoal-boundary-チェック> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-242-phase-4-2-相互レビュープロセス実装-hallucinationgoal-boundary-チェック` |
| Created | 2026-06-01T13:48:39.610Z |
| Updated | 2026-06-01T13:48:39.610Z |

## 内容

## 概要

各Agentに自身以外の初期回答をインジェクションし、レビューさせるプロセスを実装する。

## 実装内容

* 他Agentの初期回答をプロンプトに含めるテンプレート
* レビュー観点: Hallucination有無、Goal Boundary逸脱の検知
* レビュー結果の構造化データ (JSON) 取得
* レビュー結果を `debate_messages.review_targets` に保存

## 受け入れ条件 (DoD)

- [ ] 各Agentが他Agentの回答をレビューする
- [ ] レビュー結果がJSONで取得できる
- [ ] DBに保存される

## 関連ドキュメント

* design.md > フェーズ4 > 2. 相互レビュープロセス

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
