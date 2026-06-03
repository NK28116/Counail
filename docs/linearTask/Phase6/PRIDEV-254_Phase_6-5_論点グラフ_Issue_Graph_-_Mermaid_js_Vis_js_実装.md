# PRIDEV-254 - [Phase 6-5] 論点グラフ (Issue Graph) - Mermaid.js/Vis.js 実装

## メタ情報

| 項目 | 値 |
|---|---|
| Identifier | `PRIDEV-254` |
| Status | Todo |
| Priority | Medium |
| Assignee | （未割当） |
| Parent | （なし） |
| Linear URL | <https://linear.app/niwa-private-dev/issue/PRIDEV-254/phase-6-5-論点グラフ-issue-graph-mermaidjsvisjs-実装> |
| GitHub Repo | <https://github.com/NK28116/Counail> |
| Git Branch | `kazuhiro-niwa/pridev-254-phase-6-5-論点グラフ-issue-graph-mermaidjsvisjs-実装` |
| Created | 2026-06-01T13:50:15.398Z |
| Updated | 2026-06-01T13:50:15.398Z |

## 内容

## 概要

合意・対立構造をグラフィカルに表示する Issue Graph を実装する。

## 実装内容

* ライブラリ選定 (Mermaid.js または Vis.js)
* `consensus_results` データのグラフ用構造への変換
* ノード/エッジレンダリング
* 合意=緑、対立=赤、未決=黄などの色分け

## 受け入れ条件 (DoD)

- [ ] グラフが正しく描画される
- [ ] 色分けが機能する
- [ ] ノードクリックで詳細表示

## 関連ドキュメント

* design.md > フェーズ6 > 1. 主要画面の実装 (論点グラフ)

---

> このタスクは Linear プロジェクト "Counail" 配下で管理されています。実装は GitHub リポジトリ [NK28116/Counail](https://github.com/NK28116/Counail) に集約されます。
