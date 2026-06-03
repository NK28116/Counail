# PRIDEV-252 - [Phase 6-3] 討論ビジュアルビュー - Agent発言タイムライン

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-252` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-252/phase-6-3-討論ビジュアルビュー-agent発言タイムライン> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-252-phase-6-3-討論ビジュアルビュー-agent発言タイムライン` |
| Created | 2026-06-01T13:50:02.298Z |
| Updated | 2026-06-01T13:50:02.298Z |

## 内容

## 概要

各Agentの発言を時系列で表示するタイムラインUIを実装する。

## 実装内容

* `src/features/debate-view/Timeline.tsx` 実装
* Agentごとに色分け
* 発言内容のmarkdownレンダリング
* レビュー指摘の対象発言へのリンク

## 受け入れ条件 (DoD)

- [ ] 発言が時系列順で表示される
- [ ] Agentごとに視覚的に区別できる
- [ ] markdown が正しくレンダリングされる

## 関連ドキュメント

* design.md > フェーズ6 > 1. 主要画面の実装 (討論ビジュアルビュー)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
