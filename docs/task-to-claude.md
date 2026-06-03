# Claudeへの指示書: Linear Task作成

## 1. 概要
本ドキュメントは、実装AI（Claude）に対するLinear上のタスク（Issue）作成指示書である。

## 2. 前提条件と参照ドキュメント
- **要件定義書**: [specification.md](file:///Users/niwa_kazuhiro/Documents/PrivateDevelop/Counail/docs/specification.md)
- **実装方針および詳細設計**: [design.md](file:///Users/niwa_kazuhiro/Documents/PrivateDevelop/Counail/docs/design.md)
- **適用プロンプト**: [create_linear_task.md](file:///Users/niwa_kazuhiro/Documents/PrivateDevelop/Counail/prompts/claude/create_linear_task.md)

## 3. 指示内容
以下のLinearプロジェクトに対して、[design.md](file:///Users/niwa_kazuhiro/Documents/PrivateDevelop/Counail/docs/design.md) に示された開発フェーズに基づき、タスク（Issue）の作成および紐付けを行ってください。

- **対象Linearプロジェクト**: `https://linear.app/niwa-private-dev/project/counail-324a14bfe713/overview`
  - *プロジェクト名またはID*: `counail-324a14bfe713`

### タスク作成時のルール
1. **フェーズごとの分割**: [design.md](file:///Users/niwa_kazuhiro/Documents/PrivateDevelop/Counail/docs/design.md) のフェーズ1からフェーズ7までの開発ステップを網羅してください。
2. **適切な粒度**: 1つのタスクが0.5時間〜2時間程度で完了でき、テスト可能なサイズ（1ファイルまたは1機能単位）に細分化してください。
3. **タスク情報の記述**:
   - **タイトル**: 具体的かつ明快なアクション（例: 「[Phase 1] Supabase データベーススキーマの定義とマイグレーション適用」）
   - **説明**: 実装する内容の詳細と、関連する [design.md](file:///Users/niwa_kazuhiro/Documents/PrivateDevelop/Counail/docs/design.md) のセクションへの言及。
   - **受け入れ条件**: 完了定義（DoD）（例: 「正常系テストがパスする」「APIキーの暗号化検証ができる」）
   - **依存関係**: 先行タスクを設定できる場合は指定。
4. **優先度と順序付け**: タイトルの先頭に `[Phase X]` などの識別子を付け、実装順序を明確にしてください。

## 4. 追加指示: 重複・非推奨となったドキュメントの物理削除
ドキュメントの再構築に伴い、以下のファイルは中身が他ドキュメントに統合され不要となりました。実装エージェント（Claude等）は、Linearタスク作成処理の実行時に、以下のファイルをファイルシステム上から物理削除（削除コマンド等）してください。

- `docs/coding-standards.md` （`docs/design.md` へ統合済み）
- `docs/ci-cd.md` （`docs/release-strategy.md` へ統合済み）
- `docs/ai-rules.md` （`docs/ai-trinity-protocol.md` へ統合済み）
- `docs/workflow.md` （`docs/ai-trinity-protocol.md` へ統合済み）

