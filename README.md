# Human-AI Collaboration Playbook（配布 repo）

- 案件名：hac-playbook
- 目的：AI と協働するための考え方と型（Playbook）を、受講者が手元の AI に読ませて質問できる形で配る
- 対象範囲：`playbook-full.md`（本文）と `playbook-qa/`（本文だけを根拠に答える Skill）。研修の進行や宿題は範囲外（bw の研修案件側）
- 成果物・提出先：この repo そのもの。受講者は git clone で受け取り、更新も clone 側で取り込む
- 完了条件・検証方法：
  1. 受講者が clone とリンクの2手順だけで「プレイブックに聞いて」を使える
  2. Skill が答える前に remote の新版を確かめ、遅れていれば取り込む（`playbook-qa/check-update.sh` を clone で検証）
  3. どのファイルにも顧客名・個人名・契約情報を含まない

## 受講者向け：使い方

1. clone する（置き場は `~/work/knowledge/hac-playbook`）。

```bash
git clone https://github.com/agent-workspace-template/hac-playbook.git ~/work/knowledge/hac-playbook
```

2. Skill のリンクを張る（1回だけ）。

```bash
mkdir -p ~/.agents/skills ~/.claude/skills && ln -s ~/work/knowledge/hac-playbook/playbook-qa ~/.agents/skills/playbook-qa && ln -s ../../.agents/skills/playbook-qa ~/.claude/skills/playbook-qa
```

3. AI に「プレイブックに聞いて」と言い、続けて質問を書く。答えには根拠の型番号（例：B-1）が付くので、その項目を `playbook-full.md` で自分でも読む。
4. 「この文書には書かれていません」と返った質問は、場面を添えて配布した担当者に知らせる。次の版で型を足す材料にする。

Skill は答える前に自動で新版を確かめるので、手動の `git pull` は要らない。手元で `playbook-full.md` を書き換えると更新を取り込めなくなるので、メモは別の場所に取る。
