# 자동 업데이트 절차 (세 저장소 공통)

이 문서는 Claude·Claude Code 업데이트를 확인해서 튜터 스킬을 최신 상태로 고치는 절차다. 예약 작업이 이 문서를 그대로 따르고, 사람이 손으로 할 때도 같은 순서를 쓴다.

## 대상 저장소와 스킬

| 저장소 | 스킬 | 사실 파일 |
|---|---|---|
| sanh09/code-guide-protocol | `cc-basics-ko`, `cc-intermediate-ko`, `cc-advanced-ko` | `plugins/<스킬>/skills/<스킬>/references/facts.md` |
| sanh09/guide-protocol | `cc-basics-ko-app`, `cc-intermediate-ko-app`, `cc-advanced-ko-app`, `ai-chat-guide-ko` | `skills/<스킬>/references/facts.md` |
| sanh09/app-guide-plugin | `ai-chat-guide-ko` | `plugins/ai-chat-guide-ko/skills/ai-chat-guide-ko/references/facts.md` |

짝을 이루는 파일은 같은 사실을 담아야 한다.
- `cc-X-ko`(code-guide-protocol) ↔ `cc-X-ko-app`(guide-protocol)의 `facts.md`와 `curriculum.md`. 단, 앱 버전 curriculum에서는 학습 기록 파일(`cc-tutor-progress.md`) 관련 문장을 뺐다. 그 차이는 유지한다.
- `ai-chat-guide-ko`(guide-protocol) ↔ `ai-chat-guide-ko`(app-guide-plugin)은 완전히 같은 파일이다.

## 1. 상태 확인

`maintenance/state.json`(이 저장소)을 읽는다. `last_checked`, `claude_code_version`, `claude_app_release_notes_through`가 지난 확인 시점이다.

## 2. 바뀐 내용 모으기

- **Claude Code**: 최신 버전(`npm view @anthropic-ai/claude-code version`, 안 되면 아래 changelog)과 지난 확인 버전 이후의 변경 내역.
  - 변경 내역: https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md (또는 https://code.claude.com/docs/en/changelog)
- **Claude 앱**: https://support.claude.com/en/articles/12138966-release-notes 에서 지난 확인 날짜 이후 항목.

## 3. 영향 판단

모은 변경 중 스킬이 가르치는 내용에 닿는 것만 고른다. 예:
- Claude Code: 슬래시 명령 추가·이름 변경·삭제, 단축키, 권한 모드와 기본값, settings.json 키·위치·우선순위, CLAUDE.md 규칙, 스킬·서브에이전트·훅·MCP·플러그인 형식과 명령, `-p`·`--bare` 등 플래그.
- Claude 앱: 메뉴 경로(설정·사용자 정의), 프로젝트·메모리·시크릿 채팅·아티팩트·커넥터·스킬·플러그인·음성 모드의 동작과 제공 요금제, 파일 한도.

버그 수정, 성능 개선, 스킬이 다루지 않는 기능은 건너뛴다.

## 4. 공식 문서로 확인하고 고치기

- 고르기 전에 반드시 해당 공식 문서(https://code.claude.com/docs/llms.txt 목록, https://support.claude.com)를 열어 현재 내용을 확인한다. changelog 한 줄만 보고 고치지 않는다.
- `facts.md`를 먼저 고치고, 같은 사실을 쓰는 `curriculum.md`(레슨 설명·실습·퀴즈 정답)와 `SKILL.md`, `gating.md`의 확인 퀴즈도 맞춘다. 퀴즈 정답이 바뀌면 보기와 해설도 같이 고친다.
- 짝을 이루는 파일(위 표)도 같은 내용으로 고친다.
- 고친 `facts.md`의 "마지막 확인" 날짜를 오늘로 바꾼다.
- 퀴즈 정답은 `references/quiz-answers.md`에만 둔다. `curriculum.md`·`gating.md`의 문제 줄에는 정답이나 해설을 쓰지 않는다. 문제를 고치거나 추가하면 같은 번호(L레슨-순번, C-순번)의 정답표 줄도 고친다. 정답표에는 보기 번호가 아니라 보기 내용을 쓴다.
- 확실하지 않으면 고치지 않고 실행 보고에 "확인 필요"로 남긴다.
- 문체: 한국어, 기존 표현과 서식을 따른다.

## 5. 버전·빌드·검증

- code-guide-protocol: 바뀐 플러그인의 `plugins/<스킬>/.claude-plugin/plugin.json`의 `version` 패치 번호를 올린다(예: 0.1.2 → 0.1.3).
- app-guide-plugin: `plugins/ai-chat-guide-ko/.claude-plugin/plugin.json`의 `version`을 올린다.
- guide-protocol, app-guide-plugin: `bash scripts/build-dist.sh`로 `dist/` zip을 다시 만든다.
- `claude plugin validate .`가 code-guide-protocol, app-guide-plugin에서 통과해야 한다. (`claude`가 없으면 `npm i -g @anthropic-ai/claude-code`.) LICENSE·README·icon 경고는 무시한다.
- `bash -n install.sh`가 통과해야 한다.

## 6. 기록하고 PR로 반영

변경은 `main`에 바로 push하지 않고, 저장소마다 PR을 만들어 검증 후 merge한다.

- 이 저장소의 `maintenance/state.json`을 오늘 날짜와 확인한 버전으로 갱신한다.
- `maintenance/CHANGELOG.md` 맨 위에 항목을 추가한다: 날짜, 확인한 버전, 바꾼 내용(한 줄씩), 바꾼 저장소.
- 바뀐 저장소마다:
  1. 브랜치 만들기: `git checkout -b auto-update/YYYY-MM-DD`
  2. 커밋 후 push: `git -c push.negotiate=true push -u origin auto-update/YYYY-MM-DD`. 커밋 메시지 예: `Update facts for Claude Code 2.1.340: /foo renamed to /bar`
  3. PR 만들기(`gh pr create`가 안 되면 `gh api`):
     `gh api repos/sanh09/<저장소>/pulls -f title="<제목>" -f head="auto-update/YYYY-MM-DD" -f base=main -f body="<본문>"`
     - 본문: 바꾼 내용, 근거가 된 공식 문서 링크, 확인한 버전, 검증 결과(5단계). 한국어로 쓴다.
     - 본문에 "Generated with Claude Code" 같은 생성 도구 표시 줄은 넣지 않는다.
  4. 5단계 검증이 모두 통과했으면 merge한다: `gh api -X PUT repos/sanh09/<저장소>/pulls/<번호>/merge -f merge_method=squash`
  5. merge가 거부되면(충돌, 보호 규칙 등) PR을 열어 둔 채로 실행 보고에 적는다.
- 내용 변경이 없으면: 마지막 state 커밋 이후 7일이 지났을 때만 state.json을 갱신해 같은 방식(PR → merge)으로 반영한다(`chore: update check state`). 그 밖에는 아무것도 만들지 않는다.

## 7. 실행 보고

마지막에 한국어로 짧게 보고한다: 확인한 버전·날짜 범위, 바꾼 내용과 저장소, 건너뛴 변경 중 "확인 필요" 항목. 바꾼 것이 없으면 "변경 없음"이라고 한 줄로 쓴다.

## 하지 않는 것

- `main`에 직접 push, 저장소 이름 변경, 삭제, 강제 push(`--force`), 히스토리 다시 쓰기
- 스킬 구조나 수업 방식 같은 설계 변경 (사실 갱신만 한다)
- 출처 없는 내용 추가
