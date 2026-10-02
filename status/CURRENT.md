# 現在の状況

- 更新日：2026-10-02（Skill を2段構えに変更：Playbook にあることは型番号つき、無いことは「Playbook 外」と明記して一般の知識で答える。本文「疑問があるとき」に Skill で聞く場合を追記）
- 状態：配布可能。origin = https://github.com/agent-workspace-template/hac-playbook（Public。認証不要で clone・更新確認ができる）
- 完了したこと：`~/work/cmp-academy/output/hac-playbook/playbook-full.md` を複製、`playbook-qa/`（SKILL.md・check-update.sh）を `tools/skills/` から移設し、`tools/skills/playbook-qa` はここへのリンクにした。check-update.sh はローカル repo を remote に見立てて、最新・遅れ取り込み・手元変更・remote 不達・clone なし・リンク経由の各経路を検証済み
- 次の作業：
  1. README「受講者向け：使い方」を受講者に渡す（Public なので招待は不要）
  3. `~/.codex/config.toml` の trusted にこの案件を登録する（Codex を使う場合）
- 未解決事項：なし（principles.md は 2026-10-02 に追随済み。cmp-academy 側は未コミット）
- 検証結果・未検証事項：実 repo から clone → リンク経由で check-update.sh が「最新」を返すことを確認（2026-10-02）。Claude デスクトップアプリが Skill を認識することも確認。Codex 実機、Windows での bash は未検証
- 成果物：`playbook-full.md`（2026-10-02、v1）、`playbook-qa/`
- Public で保つための決まり：顧客名・個人名・契約情報・社内限りの情報をどのファイルにも書かない（AGENTS.md に明記済み）。
- これを外すと成立しない勘所：受講者の clone 先は `~/work/knowledge/hac-playbook` 固定ではなく、Skill は自分が置かれた clone を `pwd -P` で探す。手元の変更があると取り込みを止める（本文を読み専用に保つため）
