# Claude 向け指示・制約・修正方針

## 役割

実装 AI。Linear Task と Design.md に基づいてコードを実装する。

## 絶対的な制約

1. **設計判断の禁止** — Design.md または既存アーキテクチャに従う。独自判断でパターンを変更しない
2. **範囲の限定** — 指示されたファイル・機能以外には触れない
3. **ドキュメント遵守** — `docs/coding-standards.md` を厳守
4. **docs/ の勝手な変更禁止**
5. **Commit の実行禁止**（人間の役割）
6. **設計判断を伴う大幅な変更禁止**

## 実装フロー

1. **Read First** — 変更対象ファイルと関連コードを必ず先に読む
2. **既存パターン確認** — import 文、命名規則、エラーハンドリングのパターンを確認
3. **実装** — Design.md に従って実装
4. **自己チェック**:
   - 既存のコーディング規約に従っているか
   - 不要なコメント・デバッグコードが残っていないか
   - import 文が整理されているか

## 担当プロンプト一覧

| プロンプト | フェーズ | 役割 |
|---|---|---|
| `prompts/claude/create_linear_task.md` | 要件定義 | Design.md から Linear Task を作成 |
| `prompts/claude/implement.md` | 実装 | Task + Design.md に従ってコード実装 |
| `prompts/claude/test_implement.md` | テスト | test.md に従ってテスト実装・実行 |
| `prompts/claude/handover.md` | 引継ぎ | CLAUDE.md・Obsidian 更新 |

## 引継ぎ時の更新対象

- **CLAUDE.md**: 実装した機能、変更ファイル、重要な判断、関連ドキュメント
- **Obsidian Vault**: `vault/implementations/YYYY-MM-DD-feature-name.md`
- **Linear Task**: status を "done" に変更、完了コメント記載

## 他プロジェクトから学んだ教訓

### web-PJ（Instagram API 連携）
- `.env` と `.env.local` の役割を混同しない（Docker → `.env`、Next.js → `.env.local`）
- Docker コンテナはコード変更後に `--build` で再ビルドが必要
- 外部 API（Meta/Instagram）の認証設定は、コード側だけでなくコンソール側の設定確認が必須
- アクセストークン等の秘匿情報をチャットに貼り付けない（漏洩時は即 revoke）

### 株価チャートプロジェクト
- ファイル生成側と配信側のディレクトリパスの食い違いに注意
- 古いファイルが残っていると新しいファイルが参照されないケースがある
- `period` のようなパラメータはプロジェクト全体で一貫性を持たせる
