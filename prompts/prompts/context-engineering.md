# Context Engineering 方針

## 基本思想

ChatGPT セッションで確立された原則:

> 「長期保存」と「推論注入」を分離する

- **memory（検索対象）**: Obsidian Vault — 蓄積された知識、過去ログ、リファレンス
- **context（注入対象）**: `.context/current.md` — LLM に渡す圧縮文脈

## ディレクトリ設計（採用方針）

### プロジェクトレベル
```
project/
├── CLAUDE.md          # 不変ルール（法律）
├── GEMINI.md          # 三位一体プロトコル定義
├── .context/
│   └── current.md     # 動的タスク（今日の仕事）
├── docs/
├── prompts/
└── src/
```

### グローバルレベル
```
~/.config/llm/
├── rules/
│   ├── coding.md
│   ├── naming.md
│   └── token-efficiency.md
├── agents/
│   ├── claude/role.md
│   ├── gemini/role.md
│   └── chatgpt/role.md
└── formats/
    ├── task.template.md
    └── context.template.md
```

### 知識層（Obsidian Vault in iCloud）
```
vault/
├── 00_Agent/
├── 01_Learning/        # 技術知識（検索対象）
├── 02_Projects/        # 非公開ドキュメント
├── 03_Ideas/
├── 04_Daily/           # 日報 = logs
└── ...
```

## context ファイルのルール

1. **1 context file = 300〜800 tokens** — 超えたら分割
2. **短く保つ** — LLM の安定性がトークン量に反比例する
3. **命名規則**: `*.context.md`, `*.task.md`, `*.state.md`, `*.constraints.md`

## context ファイルのテンプレート

```markdown
# Goal
（何を達成するか）

# Current
（今どこまで進んでいるか）

# Constraints
- （制約条件）

# Known Issues
- （既知の問題）

# Next
（次にやること）
```

## 情報の流れ

```
Human thought → ~/inbox → Gemini（圧縮） → .context/ → Claude（実装） → ~/logs → context に圧縮して戻す
```

## 採用しなかったもの

| 提案 | 不採用理由 |
|---|---|
| `~/agents/` 独立ディレクトリ | 三位一体プロトコルが PrivateDevelop の GEMINI.md で定義済み。分散は管理コスト増 |
| `~/logs/` 独立ディレクトリ | Obsidian Vault の `04_Daily/` が既にこの役割を担っている |
| `~/vault/` 新設 | iCloud の Obsidian Vault がそのまま使える |
| `~/context/active/` をホーム直下に | プロジェクトの文脈はプロジェクト内に置くべき |

## 現フェーズの方針

> 今のフェーズは「Context Engineering フェーズ」。完璧な構造ではなく、文脈循環を実際に回すこと。

まだ早いもの:
- ベクトル DB
- 自律エージェント
- MCP 大量接続
- memory 自動化
