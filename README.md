# cc-basics-ko: 한국어 Claude Code 기초 튜터

터미널과 코딩이 처음인 사람에게 Claude Code 기초를 **한국어로, 한 단계씩** 가르치는 Claude Code 스킬입니다.

- 단계별 튜토리얼: 한 번에 개념 1~3개와 바로 해 볼 실습 1개
- 퀴즈: 상황 판단형 객관식, 정답은 답을 보낸 뒤 공개
- 다루는 범위: 기본 대화, 입력 기호(`/`, `!`, `@`)와 단축키, 대화 관리(`/clear`, `/compact`, `/resume`, `/rewind`), 권한과 모드, `CLAUDE.md`, `settings.json`
- 명령어·경로 정보는 공식 문서(https://code.claude.com/docs)로 확인한 내용이 `references/facts.md`에 정리되어 있습니다 (2026-11 기준)

## 설치

### 방법 1. 플러그인으로 설치 (추천, 업데이트 받기 쉬움)

Claude Code 안에서:

```
/plugin marketplace add sanh09/<저장소-이름>
/plugin install cc-basics-ko@sanh09-skills
```

또는 터미널에서:

```bash
claude plugin marketplace add sanh09/<저장소-이름>
claude plugin install cc-basics-ko@sanh09-skills
```

### 방법 2. 스킬 폴더만 복사

```bash
git clone https://github.com/sanh09/<저장소-이름>.git
mkdir -p ~/.claude/skills
cp -r <저장소-이름>/plugins/cc-basics-ko/skills/cc-basics-ko ~/.claude/skills/
```

특정 프로젝트에서만 쓰려면 `~/.claude/skills/` 대신 그 프로젝트의 `.claude/skills/`에 복사하세요.

## 사용법

Claude Code를 켜고 이렇게 말하면 스킬이 자동으로 쓰입니다.

- "클로드 코드 처음이에요. 처음부터 알려주세요"
- "/compact랑 /clear 차이가 뭐예요?"
- "CLAUDE.md 퀴즈 내주세요"

직접 부르려면 `/cc-basics-ko`를 입력하세요(플러그인으로 설치했다면 `/cc-basics-ko:cc-basics-ko`).

## 구조

```
.claude-plugin/marketplace.json           마켓플레이스 정의 (sanh09-skills)
plugins/cc-basics-ko/
  .claude-plugin/plugin.json              플러그인 정의
  skills/cc-basics-ko/
    SKILL.md                              튜터 규칙
    references/curriculum.md              레슨 1~6, 실습, 퀴즈 문제 은행
    references/facts.md                   공식 문서로 확인한 명령어·설정 정리
    evals/                                테스트 케이스 (claude plugin eval 형식)
```

## 테스트

스킬 폴더에서 다음을 실행하면 테스트 케이스를 스킬 있음/없음으로 비교합니다 (실제 모델 호출이라 비용이 듭니다).

```bash
cd plugins/cc-basics-ko/skills/cc-basics-ko
claude plugin eval . --allow-tools Write,Edit,Bash
```
