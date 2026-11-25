#!/usr/bin/env bash
# code-guide-protocol 스킬 설치 스크립트
#
# 사용법:
#   curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- basics intermediate
#   curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- --project
#   curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- --uninstall
#
# 과정 이름: basics | intermediate | advanced | all (기본값 all)
# 옵션:
#   --project    현재 폴더의 .claude/skills/ 에 설치 (기본: ~/.claude/skills/)
#   --uninstall  설치한 스킬 폴더 삭제
#   --help       도움말
#
# 환경 변수:
#   CLAUDE_GUIDE_REF  받을 브랜치 또는 태그 (기본 main)
#   CLAUDE_GUIDE_SRC  인터넷 대신 이 로컬 폴더에서 설치 (테스트용)

set -euo pipefail

REPO="sanh09/code-guide-protocol"
REF="${CLAUDE_GUIDE_REF:-main}"

say()  { printf '%s\n' "$*"; }
fail() { printf '오류: %s\n' "$*" >&2; exit 1; }

usage() {
  cat <<EOF
code-guide-protocol 스킬 설치

  curl -fsSL https://raw.githubusercontent.com/${REPO}/main/install.sh | bash [-s -- 인자...]

과정:  basics | intermediate | advanced | all (기본값 all)
옵션:  --project    현재 폴더의 .claude/skills/ 에 설치 (기본: ~/.claude/skills/)
       --uninstall  설치한 스킬 폴더 삭제
       --help       이 도움말

자세한 내용: https://github.com/${REPO}
EOF
}

# ---- 인자 해석 ----
scope="user"
action="install"
levels=()
for arg in "$@"; do
  case "$arg" in
    basics|intermediate|advanced) levels+=("$arg") ;;
    all) levels=(basics intermediate advanced) ;;
    --project) scope="project" ;;
    --uninstall) action="uninstall" ;;
    -h|--help) usage; exit 0 ;;
    *) fail "알 수 없는 인자: $arg (basics, intermediate, advanced, all, --project, --uninstall 중에서 고르세요)" ;;
  esac
done
[ ${#levels[@]} -eq 0 ] && levels=(basics intermediate advanced)

skill_name() {
  case "$1" in
    basics) echo "cc-basics" ;;
    intermediate) echo "cc-intermediate" ;;
    advanced) echo "cc-advanced" ;;
  esac
}

if [ "$scope" = "project" ]; then
  dest="$(pwd)/.claude/skills"
else
  dest="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
fi

# ---- 삭제 ----
if [ "$action" = "uninstall" ]; then
  for lv in "${levels[@]}"; do
    name="$(skill_name "$lv")"
    if [ -d "$dest/$name" ] && [ -f "$dest/$name/SKILL.md" ]; then
      rm -rf "${dest:?}/$name"
      say "삭제함: $dest/$name"
    else
      say "없음(건너뜀): $dest/$name"
    fi
    # 예전 이름(-ko)으로 설치된 폴더도 함께 지운다
    if [ -f "$dest/$name-ko/SKILL.md" ]; then
      rm -rf "${dest:?}/$name-ko"
      say "삭제함(예전 이름): $dest/$name-ko"
    fi
  done
  say "학습 기록(~/.claude/cc-tutor-progress.md)은 남겨 두었어요. 필요 없으면 직접 지우세요."
  exit 0
fi

# ---- 내려받기 ----
command -v tar >/dev/null 2>&1 || fail "tar 명령이 필요해요."
tmp="$(mktemp -d 2>/dev/null || mktemp -d -t code-guide-protocol)"
trap 'rm -rf "$tmp"' EXIT

if [ -n "${CLAUDE_GUIDE_SRC:-}" ]; then
  [ -d "$CLAUDE_GUIDE_SRC/plugins" ] || fail "CLAUDE_GUIDE_SRC에 plugins 폴더가 없어요: $CLAUDE_GUIDE_SRC"
  src="$CLAUDE_GUIDE_SRC"
  say "로컬 폴더에서 설치해요: $src"
else
  command -v curl >/dev/null 2>&1 || fail "curl 명령이 필요해요."
  url="https://codeload.github.com/${REPO}/tar.gz/${REF}"
  say "내려받는 중: ${REPO} (${REF})"
  curl -fsSL "$url" -o "$tmp/src.tar.gz" || fail "내려받기에 실패했어요: $url"
  tar -xzf "$tmp/src.tar.gz" -C "$tmp"
  src="$(find "$tmp" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  [ -d "$src/plugins" ] || fail "내려받은 파일에서 plugins 폴더를 찾지 못했어요."
fi

# ---- 설치 ----
mkdir -p "$dest"
for lv in "${levels[@]}"; do
  name="$(skill_name "$lv")"
  from="$src/plugins/$name/skills/$name"
  [ -f "$from/SKILL.md" ] || fail "스킬을 찾지 못했어요: $from"
  rm -rf "${dest:?}/$name"
  # 예전 이름(-ko)으로 설치된 폴더가 있으면 지운다. 남아 있으면 같은 스킬이 두 번 보인다.
  if [ -f "$dest/$name-ko/SKILL.md" ]; then
    rm -rf "${dest:?}/$name-ko"
    say "예전 이름 폴더를 지웠어요: $dest/$name-ko"
  fi
  mkdir -p "$dest/$name"
  # 테스트 케이스(evals)는 사용자에게 필요 없으므로 빼고 복사
  (cd "$from" && tar --exclude='./evals' -cf - .) | (cd "$dest/$name" && tar -xf -)
  say "설치함: $dest/$name"
done

say ""
say "설치를 마쳤어요. Claude Code를 새로 켜면 바로 쓸 수 있어요."
say "  예) \"클로드 코드 처음이에요. 처음부터 알려주세요\" 또는 /cc-basics"
say "같은 과정을 플러그인(/plugin install)으로도 설치했다면 하나만 남겨 두세요. 둘 다 있으면 같은 스킬이 두 번 보여요."
