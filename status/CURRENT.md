# 現在の状況

- 更新日：2026-10-02（土台から前提・4段階を削除。骨組みの正本を principles.md からこの Playbook に切り替え。v1 を初回コミット）
- 状態：v1 をコミット済み（remote 未設定、未 push）
- 完了したこと：`~/work/cmp-academy/output/hac-playbook/playbook-full.md` を複製、`playbook-qa/`（SKILL.md・check-update.sh）を `tools/skills/` から移設し、`tools/skills/playbook-qa` はここへのリンクにした。check-update.sh はローカル repo を remote に見立てて、最新・遅れ取り込み・手元変更・remote 不達・clone なし・リンク経由の各経路を検証済み
- 次の作業：
  1. GitHub に配布 repo を作って remote を設定し、初回 commit と push（人が行う）
  2. README の `<この repo の URL>` を実 URL に置き換える
  3. `~/.codex/config.toml` の trusted にこの案件を登録する（Codex を使う場合）
  4. `~/work/cmp-academy/curriculum/principles.md` を Playbook に追随させる（前提・4段階の削除。cmp-academy で起動して行う）
- 未解決事項：配布 repo の URL。principles.md の追随
- 検証結果・未検証事項：スクリプトはローカルで検証済み。GitHub 実 repo での fetch、Codex 実機、Windows での bash は未検証
- 成果物：`playbook-full.md`（2026-10-02、v1）、`playbook-qa/`
- これを外すと成立しない勘所：受講者の clone 先は `~/work/knowledge/hac-playbook` 固定ではなく、Skill は自分が置かれた clone を `pwd -P` で探す。手元の変更があると取り込みを止める（本文を読み専用に保つため）
