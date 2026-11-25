# code-guide-protocol: Claude Code 학습 과정 (기초 · 중급 · 고급)

[English](README.md) | **한국어**

> **응답 언어**: 모든 튜터는 학습자가 쓰는 언어(한국어, 영어, 일본어 등)로 답합니다. All tutors reply in the learner's language.


Claude Code를 **한 단계씩** 배우는 튜터 스킬 모음입니다. 각 과정은 튜토리얼, 실습 과제, 퀴즈로 구성되어 있습니다.

| 과정 | 플러그인 | 대상 | 다루는 내용 |
|---|---|---|---|
| 기초 | `cc-basics` | 터미널·코딩이 처음인 사람 | 첫 대화, 입력 기호(`/` `!` `@`)와 단축키, 대화 관리(`/clear` `/compact` `/resume` `/rewind`), 권한과 모드, `CLAUDE.md`, `settings.json` |
| 중급 | `cc-intermediate` | 개발 경험자 또는 기초 수료자 | 좋은 요청 쓰기, 탐색→계획→구현→커밋(plan 모드), git·PR·체크포인트, 권한 규칙 심화, 나만의 슬래시 명령(스킬), 세션·컨텍스트 관리, `claude -p` |
| 고급 | `cc-advanced` | 중급 수료자 또는 확인 퀴즈 통과자 | 확장 기능 고르기, MCP, 서브에이전트, 훅, 스킬·플러그인 제작과 배포, `--bare`·CI·GitHub Actions 자동화, worktree 병렬 작업과 리뷰 |

## 수준 확인 (중급·고급)

- **중급**: 시작할 때 개발 경험을 묻습니다. 개발 경험이 있으면 바로 시작합니다. 없으면 기초 수료를 확인하고, 수료하지 않았다면 기초 과정으로 안내합니다. 수료했지만 기록이 없다면 확인 퀴즈(5문제 중 4문제 이상)로 확인합니다.
- **고급**: 중급 수료를 확인합니다. 개발 경험이 있으면 중급 확인 퀴즈를 통과해도 시작할 수 있습니다. 개발 경험이 없으면 기초 → 중급 순서로 수료해야 합니다.
- 학습 기록은 동의를 받은 뒤 `~/.claude/cc-tutor-progress.md`에 저장되며, 세 과정이 같이 씁니다.

명령어·경로·설정 정보는 공식 문서(https://code.claude.com/docs)로 확인한 내용이 각 스킬의 `references/facts.md`에 정리되어 있습니다(2026-11 기준).

## 설치

Claude Code 안에서:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install cc-basics@sanh09-skills
/plugin install cc-intermediate@sanh09-skills
/plugin install cc-advanced@sanh09-skills
```

또는 터미널에서:

```bash
claude plugin marketplace add sanh09/code-guide-protocol
claude plugin install cc-basics@sanh09-skills
claude plugin install cc-intermediate@sanh09-skills
claude plugin install cc-advanced@sanh09-skills
```

필요한 과정만 골라 설치해도 됩니다.

### curl로 설치하기 (플러그인 없이, macOS·Linux·WSL)

터미널에서 한 줄이면 세 과정이 모두 `~/.claude/skills/`에 설치됩니다.

```bash
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash
```

원하는 과정만 설치하거나 위치를 바꿀 수도 있어요. `bash -s --` 뒤에 인자를 붙이세요.

```bash
# 기초와 중급만 설치
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- basics intermediate

# 지금 폴더(프로젝트)의 .claude/skills/ 에 설치. 팀과 git으로 공유할 때
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- --project

# 삭제
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- --uninstall
```

| 인자 | 뜻 |
|---|---|
| `basics` `intermediate` `advanced` | 설치할 과정 (여러 개 가능) |
| `all` | 세 과정 모두 (기본값) |
| `--project` | `~/.claude/skills/` 대신 현재 폴더의 `.claude/skills/`에 설치 |
| `--uninstall` | 설치한 스킬 폴더 삭제 (학습 기록은 남김) |

- 업데이트: 같은 명령을 다시 실행하면 최신 버전으로 덮어씁니다.
- 설치 뒤 Claude Code를 새로 켜고, `/cc-basics`, `/cc-intermediate`, `/cc-advanced`로 부르거나 그냥 말로 요청하세요.
- 플러그인 방식과 curl 방식 중 **하나만** 쓰세요. 둘 다 설치하면 같은 스킬이 두 번 보입니다.
- 스크립트는 실행 전에 내용을 확인할 수 있어요: `curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | less`
- Windows에서는 WSL이나 Git Bash에서 실행하거나, 위의 플러그인 방식을 쓰세요.

## Claude 웹·데스크톱 앱에서 쓰기

이 저장소의 스킬은 **Claude Code 전용**이에요. Claude 웹(claude.ai)이나 데스크톱 앱의 채팅에서 배우려면 앱 전용 버전을 쓰세요: https://github.com/sanh09/guide-protocol

## 사용법

Claude Code에서 이렇게 말하면 알맞은 스킬이 자동으로 쓰입니다.

- 기초: "클로드 코드 처음이에요. 처음부터 알려주세요", "CLAUDE.md 퀴즈 내주세요"
- 중급: "Claude Code 중급 시작할래요", "plan 모드 잘 쓰는 법", "권한 규칙 쓰는 법"
- 고급: "MCP 서버 연결하는 법", "훅 설정하고 싶어요", "플러그인 만들어서 배포하기"

직접 부르려면 플러그인으로 설치한 경우 `/cc-basics:cc-basics`, `/cc-intermediate:cc-intermediate`, `/cc-advanced:cc-advanced`를, curl로 설치한 경우 `/cc-basics`, `/cc-intermediate`, `/cc-advanced`를 입력하세요.

## 내 컴퓨터에서 하는 일

- 스킬(지침과 참고 파일)만 추가합니다. 훅, MCP 서버, 스크립트는 없고, 네트워크로 아무것도 보내지 않습니다.
- 쓰는 파일은 학습 기록 `~/.claude/cc-tutor-progress.md` 하나뿐이고, 동의한 뒤에만 만듭니다. 언제든 지워도 됩니다.
- 실습은 `CLAUDE.md` 만들기처럼 학습자가 자기 프로젝트에서 직접 해 보는 것입니다.

## 구조

```
install.sh                             curl 설치 스크립트
.claude-plugin/marketplace.json        마켓플레이스 정의 (sanh09-skills)
plugins/
  cc-basics/                        기초
  cc-intermediate/                  중급
  cc-advanced/                      고급
    .claude-plugin/plugin.json
    README.md, README.ko.md, LICENSE
    skills/<이름>/
      SKILL.md                         튜터 규칙
      references/curriculum.md         레슨, 실습, 퀴즈 문제 은행
      references/quiz-answers.md       퀴즈 정답표 (채점할 때만 읽음)
      references/facts.md              공식 문서로 확인한 사실 정리
      references/gating.md             수준 확인 절차 (중급·고급)
      evals/                           테스트 케이스 (claude plugin eval 형식)
```

## 테스트

각 스킬 폴더에서 다음 명령을 실행하면 테스트 케이스를 스킬 있음/없음으로 비교합니다(실제 모델 호출이라 비용이 듭니다).

```bash
cd plugins/cc-intermediate/skills/cc-intermediate
claude plugin eval . --allow-tools Write,Edit,Bash
```

## 업데이트 내역

### 2026-11-25: 이름에서 `-ko` 제거 (재설치 필요)
- 플러그인과 스킬 이름을 바꿨습니다: `cc-basics-ko` → `cc-basics`, `cc-intermediate-ko` → `cc-intermediate`, `cc-advanced-ko` → `cc-advanced`. 학습자가 쓰는 언어로 답하는 것은 그대로입니다.
- 예전 이름으로 저장된 학습 기록도 그대로 인정합니다.
- 버전: `cc-basics` 0.5.0, `cc-intermediate` 0.4.0, `cc-advanced` 0.4.0

**예전 이름으로 설치했다면 다시 설치하세요** (업데이트 명령으로는 새 이름으로 바뀌지 않습니다):
- 플러그인: 터미널에서 실행한 뒤 Claude Code를 다시 켜세요.
  ```bash
  claude plugin uninstall cc-basics-ko@sanh09-skills
  claude plugin uninstall cc-intermediate-ko@sanh09-skills
  claude plugin uninstall cc-advanced-ko@sanh09-skills
  claude plugin marketplace update sanh09-skills
  claude plugin install cc-basics@sanh09-skills
  claude plugin install cc-intermediate@sanh09-skills
  claude plugin install cc-advanced@sanh09-skills
  ```
  설치했던 것만 지우고, 원하는 과정만 설치하면 됩니다.
- curl 설치: 설치 명령을 다시 실행하세요. 예전 `-ko` 폴더는 자동으로 지워집니다.

### 2026-11-25: 영어 README와 라이선스
- README 기본 언어를 영어로 바꾸고, 한국어는 이 파일(README.ko.md)에서 볼 수 있습니다. 각 플러그인 폴더에도 README와 LICENSE를 넣었습니다.

### 2026-11-25: 학습자 언어로 응답
- 모든 튜터가 학습자가 쓰는 언어(한국어, 영어, 일본어 등)로 답합니다. 참고 파일은 한국어로 두고, 응답할 때 학습자의 언어로 옮깁니다.
- 퀴즈는 옮겨도 보기의 뜻을 유지하고, 채점은 뜻으로 대조합니다.
- 버전: `cc-basics-ko` 0.4.0, `cc-intermediate-ko` 0.3.0, `cc-advanced-ko` 0.3.0
- 업데이트 방법은 아래 항목과 같습니다.

### 2026-11-25: 퀴즈 정답 노출 수정
- 퀴즈를 낼 때 정답이 문제·예시·힌트에 함께 보이던 문제를 고쳤습니다. 정답은 `references/quiz-answers.md`로 분리되어 채점할 때만 쓰입니다.
- 보기 순서가 매번 섞이고, 답 형식 예시는 `1-?, 2-?`처럼 자리 표시만 씁니다.
- 입력창의 회색 자동 제안(Prompt suggestions)에 정답이 뜰 수 있어, 첫 퀴즈 때 안내하고 `/config`에서 끄는 법을 알려 줍니다.
- 버전: `cc-basics-ko` 0.3.0, `cc-intermediate-ko` 0.2.0, `cc-advanced-ko` 0.2.0

**업데이트 방법**
- 플러그인: 터미널에서 실행한 뒤 Claude Code를 다시 켜세요.
  ```bash
  claude plugin marketplace update sanh09-skills
  claude plugin update cc-basics-ko@sanh09-skills
  claude plugin update cc-intermediate-ko@sanh09-skills
  claude plugin update cc-advanced-ko@sanh09-skills
  ```
- curl 설치: 설치 명령을 다시 실행하면 최신 버전으로 바뀝니다.

전체 변경 기록: [`maintenance/CHANGELOG.md`](maintenance/CHANGELOG.md)

## 변경 방법

이 저장소의 변경은 `main`에 직접 push하지 않고 PR(Pull Request)로 진행합니다. 브랜치를 만들어 수정하고, 검증(`claude plugin validate .` 등)이 통과하면 PR을 merge합니다. 자동 업데이트도 같은 방식으로 PR을 만들고 merge합니다. 자세한 절차: https://github.com/sanh09/code-guide-protocol/blob/main/maintenance/MAINTENANCE.md

## 유지보수

Claude·Claude Code 업데이트에 맞춘 갱신 절차와 기록은 [`maintenance/`](maintenance/MAINTENANCE.md)에 있습니다. 세 저장소(code-guide-protocol, guide-protocol, app-guide-plugin)를 함께 관리합니다.

## 라이선스

MIT 라이선스입니다. [`LICENSE`](LICENSE)를 보세요(각 플러그인 폴더에도 같은 파일이 있습니다).
