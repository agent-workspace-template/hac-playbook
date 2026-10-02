# 現在の状況

- 更新日：2026-10-02（配布 repo を GitHub に作成し push。受講者手順を実 repo で通し検証。自分の環境にも Skill をリンク）
- 状態：配布可能。origin = https://github.com/agent-workspace-template/hac-playbook（Private）
- 完了したこと：`~/work/cmp-academy/output/hac-playbook/playbook-full.md` を複製、`playbook-qa/`（SKILL.md・check-update.sh）を `tools/skills/` から移設し、`tools/skills/playbook-qa` はここへのリンクにした。check-update.sh はローカル repo を remote に見立てて、最新・遅れ取り込み・手元変更・remote 不達・clone なし・リンク経由の各経路を検証済み
- 次の作業：
  1. 受講者を agent-workspace-template 組織に入れる（未所属の人がいれば）。確かめ方：`gh api orgs/agent-workspace-template/members --jq '.[].login'`
  2. README「受講者向け：使い方」を受講者に渡す
  3. `~/.codex/config.toml` の trusted にこの案件を登録する（Codex を使う場合）
  4. `~/work/cmp-academy/curriculum/principles.md` を Playbook に追随させる（前提・4段階の削除。cmp-academy で起動して行う）
- 未解決事項：principles.md の追随
- 検証結果・未検証事項：実 repo から clone → リンク経由で check-update.sh が「最新」を返すことを確認（2026-10-02）。Claude デスクトップアプリが Skill を認識することも確認。Codex 実機、Windows での bash は未検証
- 成果物：`playbook-full.md`（2026-10-02、v1）、`playbook-qa/`
- これを外すと成立しない勘所：受講者の clone 先は `~/work/knowledge/hac-playbook` 固定ではなく、Skill は自分が置かれた clone を `pwd -P` で探す。手元の変更があると取り込みを止める（本文を読み専用に保つため）
