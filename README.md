# claude-guide: 한국어 Claude Code 학습 과정 (기초 · 중급 · 고급)

Claude Code를 **한국어로, 한 단계씩** 배우는 튜터 스킬 모음입니다. 각 과정은 튜토리얼, 실습 과제, 퀴즈로 구성되어 있습니다.

| 과정 | 플러그인 | 대상 | 다루는 내용 |
|---|---|---|---|
| 기초 | `cc-basics-ko` | 터미널·코딩이 처음인 사람 | 첫 대화, 입력 기호(`/` `!` `@`)와 단축키, 대화 관리(`/clear` `/compact` `/resume` `/rewind`), 권한과 모드, `CLAUDE.md`, `settings.json` |
| 중급 | `cc-intermediate-ko` | 개발 경험자 또는 기초 수료자 | 좋은 요청 쓰기, 탐색→계획→구현→커밋(plan 모드), git·PR·체크포인트, 권한 규칙 심화, 나만의 슬래시 명령(스킬), 세션·컨텍스트 관리, `claude -p` |
| 고급 | `cc-advanced-ko` | 중급 수료자 또는 확인 퀴즈 통과자 | 확장 기능 고르기, MCP, 서브에이전트, 훅, 스킬·플러그인 제작과 배포, `--bare`·CI·GitHub Actions 자동화, worktree 병렬 작업과 리뷰 |

## 수준 확인 (중급·고급)

- **중급**: 시작할 때 개발 경험을 묻습니다. 개발 경험이 있으면 바로 시작합니다. 없으면 기초 수료를 확인하고, 수료하지 않았다면 기초 과정으로 안내합니다. 수료했지만 기록이 없다면 확인 퀴즈(5문제 중 4문제 이상)로 확인합니다.
- **고급**: 중급 수료를 확인합니다. 개발 경험이 있으면 중급 확인 퀴즈를 통과해도 시작할 수 있습니다. 개발 경험이 없으면 기초 → 중급 순서로 수료해야 합니다.
- 학습 기록은 동의를 받은 뒤 `~/.claude/cc-tutor-progress.md`에 저장되며, 세 과정이 같이 씁니다.

명령어·경로·설정 정보는 공식 문서(https://code.claude.com/docs)로 확인한 내용이 각 스킬의 `references/facts.md`에 정리되어 있습니다(2026-11 기준).

## 설치

Claude Code 안에서:

```
/plugin marketplace add sanh09/claude-guide
/plugin install cc-basics-ko@sanh09-skills
/plugin install cc-intermediate-ko@sanh09-skills
/plugin install cc-advanced-ko@sanh09-skills
```

또는 터미널에서:

```bash
claude plugin marketplace add sanh09/claude-guide
claude plugin install cc-basics-ko@sanh09-skills
claude plugin install cc-intermediate-ko@sanh09-skills
claude plugin install cc-advanced-ko@sanh09-skills
```

필요한 과정만 골라 설치해도 됩니다.

### curl로 설치하기 (플러그인 없이, macOS·Linux·WSL)

터미널에서 한 줄이면 세 과정이 모두 `~/.claude/skills/`에 설치됩니다.

```bash
curl -fsSL https://raw.githubusercontent.com/sanh09/claude-guide/main/install.sh | bash
```

원하는 과정만 설치하거나 위치를 바꿀 수도 있어요. `bash -s --` 뒤에 인자를 붙이세요.

```bash
# 기초와 중급만 설치
curl -fsSL https://raw.githubusercontent.com/sanh09/claude-guide/main/install.sh | bash -s -- basics intermediate

# 지금 폴더(프로젝트)의 .claude/skills/ 에 설치. 팀과 git으로 공유할 때
curl -fsSL https://raw.githubusercontent.com/sanh09/claude-guide/main/install.sh | bash -s -- --project

# 삭제
curl -fsSL https://raw.githubusercontent.com/sanh09/claude-guide/main/install.sh | bash -s -- --uninstall
```

| 인자 | 뜻 |
|---|---|
| `basics` `intermediate` `advanced` | 설치할 과정 (여러 개 가능) |
| `all` | 세 과정 모두 (기본값) |
| `--project` | `~/.claude/skills/` 대신 현재 폴더의 `.claude/skills/`에 설치 |
| `--uninstall` | 설치한 스킬 폴더 삭제 (학습 기록은 남김) |

- 업데이트: 같은 명령을 다시 실행하면 최신 버전으로 덮어씁니다.
- 설치 뒤 Claude Code를 새로 켜고, `/cc-basics-ko`, `/cc-intermediate-ko`, `/cc-advanced-ko`로 부르거나 그냥 말로 요청하세요.
- 플러그인 방식과 curl 방식 중 **하나만** 쓰세요. 둘 다 설치하면 같은 스킬이 두 번 보입니다.
- 스크립트는 실행 전에 내용을 확인할 수 있어요: `curl -fsSL https://raw.githubusercontent.com/sanh09/claude-guide/main/install.sh | less`
- Windows에서는 WSL이나 Git Bash에서 실행하거나, 위의 플러그인 방식을 쓰세요.

## 사용법

Claude Code에서 이렇게 말하면 알맞은 스킬이 자동으로 쓰입니다.

- 기초: "클로드 코드 처음이에요. 처음부터 알려주세요", "CLAUDE.md 퀴즈 내주세요"
- 중급: "Claude Code 중급 시작할래요", "plan 모드 잘 쓰는 법", "권한 규칙 쓰는 법"
- 고급: "MCP 서버 연결하는 법", "훅 설정하고 싶어요", "플러그인 만들어서 배포하기"

직접 부르려면 플러그인으로 설치한 경우 `/cc-basics-ko:cc-basics-ko`, `/cc-intermediate-ko:cc-intermediate-ko`, `/cc-advanced-ko:cc-advanced-ko`를, curl로 설치한 경우 `/cc-basics-ko`, `/cc-intermediate-ko`, `/cc-advanced-ko`를 입력하세요.

## 구조

```
install.sh                             curl 설치 스크립트
.claude-plugin/marketplace.json        마켓플레이스 정의 (sanh09-skills)
plugins/
  cc-basics-ko/                        기초
  cc-intermediate-ko/                  중급
  cc-advanced-ko/                      고급
    .claude-plugin/plugin.json
    skills/<이름>/
      SKILL.md                         튜터 규칙
      references/curriculum.md         레슨, 실습, 퀴즈 문제 은행
      references/facts.md              공식 문서로 확인한 사실 정리
      references/gating.md             수준 확인 절차 (중급·고급)
      evals/                           테스트 케이스 (claude plugin eval 형식)
```

## 테스트

각 스킬 폴더에서 다음 명령을 실행하면 테스트 케이스를 스킬 있음/없음으로 비교합니다(실제 모델 호출이라 비용이 듭니다).

```bash
cd plugins/cc-intermediate-ko/skills/cc-intermediate-ko
claude plugin eval . --allow-tools Write,Edit,Bash
```
