# AI 三位一体開発プロトコル

## 概要

Human（人間）・Gemini（設計AI）・Claude（実装AI）の三者が役割を分担し、人間が最終意思決定権を持つ協調開発体制。

## 役割定義

### Human（人間）
- 要件定義、優先度調整
- 命名・Lint 指導
- Commit 実行、CI/CD 確認
- 設計判断の最終承認

### Gemini（設計・検証 AI）
- Design.md 作成
- コードレビュー
- test.md 作成、テスト分析
- ドキュメント作成（DevLog.md, testReport.md, feature.json）

### Claude（実装 AI）
- Linear Task 作成
- コード実装
- テスト実装・実行
- 引継ぎドキュメント更新（CLAUDE.md, Obsidian）

## 絶対原則

1. **判断は人間が行う** — AI は役割限定で設計判断を禁止
2. **既存仕様を壊さない** — 変更前に必ず既存コード・パターンを確認
3. **AI 間の直接やり取りは禁止** — 必ず人間を経由する
4. **docs 更新なしの仕様変更は禁止**

## ワークフロー（5 フェーズ）

### フェーズ 1: 要件定義
1. Human → `docs/requirements.md` に要望を記載
2. Gemini → `prompts/gemini/create_design.md` に基づき `docs/design.md` 作成
3. Claude → `prompts/claude/create_linear_task.md` に基づき Linear Task 作成
4. Human → Linear 上で Task 優先度・親子関係を調整

### フェーズ 2: 実装
5. Claude → 実装開始（`prompts/claude/implement.md` に従う）
6. Claude → Task status を "gemini review" に変更
7. Gemini → `prompts/gemini/code_review.md` に基づきレビュー
8. Claude → レビュー指摘を反映
9. Claude → Task status を "human review" に変更
10. Human → 命名・構成・Lint を確認し指示
11. Claude → 人間の指示を反映
12. Gemini → `DevLog.md` を更新

### フェーズ 3: テスト
13. Gemini → `prompts/gemini/create_test_plan.md` に基づき `test.md` 作成
14. Claude → Task status を "test" に変更
15. Claude → `prompts/claude/test_implement.md` に基づきテスト実装・実行
16. Gemini → カバレッジと評価を実施
- 失敗時: Gemini が原因分析 → Human が構成修正指示 → Claude が修正 → フェーズ 2 へ
- 成功時: Gemini が testReport.md 作成 → Human が Commit

### フェーズ 4: CI/CD
- Human が結果確認。修正必要ならフェーズ 2 へ戻る

### フェーズ 5: 引継ぎ
28. Claude → CLAUDE.md 更新
29. Claude → Obsidian Vault 更新
30. Claude → Task status を "done" に変更
31. Gemini → feature.json 更新
32. Human → 最終 Commit

## init-ai-trinity.sh

新規プロジェクトに三位一体開発の雛形を一発セットアップするスクリプト。

```bash
./init-ai-trinity.sh /path/to/新しいプロジェクト
```

生成物:
- `.github/` — PR テンプレート、Issue テンプレート
- `docs/` — ai-rules.md, workflow.md, architecture.md 等 7 ファイル
- `prompts/claude/` — create_linear_task.md, implement.md, test_implement.md, handover.md
- `prompts/gemini/` — create_design.md, code_review.md 等 7 ファイル
- `mcp/` — filesystem, git の MCP 設定

冪等性あり（既存ファイルはスキップ）。
