#!/usr/bin/env bash
# Playbook の clone が remote の最新版かを確かめ、遅れていれば fast-forward で取り込む。
# 使い方: check-update.sh [clone のパス]   既定: このスクリプトを含む clone（playbook-qa/ の1つ上）
# 終了コード: 0=最新（または取り込み済み） 1=clone が無い／取り込めない 2=remote に届かない
set -u
DIR="${1:-$(cd "$(dirname "$0")" && cd "$(pwd -P)/.." && pwd -P)}"
FILE="playbook-full.md"

if [ ! -d "$DIR/.git" ]; then
  echo "NG: $DIR に clone がありません。配布 repo を clone してから使ってください。"
  exit 1
fi
if [ ! -f "$DIR/$FILE" ]; then
  echo "NG: $DIR に $FILE がありません。"
  exit 1
fi

cd "$DIR" || exit 1

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "注意: clone に手元の変更があります。Playbook は読み専用なので、変更は元に戻すか別の場所へ写してください。"
  echo "      git -C \"$DIR\" status --short"
  exit 1
fi

if ! git fetch --quiet 2>/dev/null; then
  echo "WARN: remote に届きません（ネット未接続か認証切れ）。手元の版で答えます。"
  echo "手元の版: $(git log -1 --format='%h %cs' 2>/dev/null || echo '未コミット') / 本文の最終更新: $(grep -m1 '^最終更新' "$FILE" || echo '記載なし')"
  echo "PLAYBOOK: $DIR/$FILE"
  exit 2
fi

UPSTREAM="$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)"
if [ -z "$UPSTREAM" ]; then
  echo "WARN: 追跡ブランチが設定されていません。手元の版で答えます。"
  echo "手元の版: $(git log -1 --format='%h %cs' 2>/dev/null || echo '未コミット')"
  echo "PLAYBOOK: $DIR/$FILE"
  exit 2
fi

BEHIND="$(git rev-list --count "HEAD..$UPSTREAM")"
if [ "$BEHIND" -gt 0 ]; then
  if git pull --ff-only --quiet; then
    echo "更新: 新しい版を ${BEHIND} コミット分取り込みました。"
  else
    echo "NG: 新しい版がありますが fast-forward できません。手元で次を確認してください: git -C \"$DIR\" status"
    exit 1
  fi
else
  echo "最新: remote と同じ版です。"
fi
echo "版: $(git log -1 --format='%h %cs' 2>/dev/null || echo '未コミット') / 本文の最終更新: $(grep -m1 '^最終更新' "$FILE" || echo '記載なし')"
echo "PLAYBOOK: $DIR/$FILE"
exit 0
