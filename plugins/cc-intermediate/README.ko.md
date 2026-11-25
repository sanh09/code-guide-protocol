# cc-intermediate: Claude Code 중급 튜터

[English](README.md) | **한국어**

실제 개발 작업에서 Claude Code를 잘 쓰는 법을 가르치는 튜터입니다. 좋은 요청 쓰기, 탐색 → 계획 → 구현 → 커밋 흐름, 긴 세션을 관리하는 기능을 튜토리얼·실습·퀴즈로 다루고, 학습자가 쓰는 언어로 답합니다.

## 레슨

1. 좋은 요청 쓰기
2. 탐색 → 계획 → 구현 → 커밋 (plan 모드)
3. git·PR·체크포인트와 함께 쓰기
4. 권한 규칙 심화(allow, ask, deny)
5. 나만의 슬래시 명령(스킬) 만들기
6. 세션과 컨텍스트 관리 심화
7. `claude -p` 비대화형 실행

## 시작하기 전에

튜터가 먼저 개발 경험을 묻습니다. 경험이 있으면 바로 시작합니다. 없으면 기초 과정(`cc-basics`)을 마쳤는지 확인하고, 기록이 없으면 짧은 확인 퀴즈(5문제 중 4문제 이상)를 보며, 기초를 듣지 않았다면 기초 과정으로 안내합니다.

## 시작하기

대화를 시작하고 배우고 싶은 내용을 말하세요. 예:

- "Claude Code 중급 시작할래요"
- "plan 모드 잘 쓰는 법"
- "권한 규칙 쓰는 법"

메뉴 경로·명령어·설정은 공식 문서로 확인해 `skills/cc-intermediate/references/facts.md`에 정리했습니다. 퀴즈 정답은 별도 파일에 두고 채점할 때만 읽으므로, 답하기 전에 보이지 않습니다.

## 설치

Claude Code에서:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install cc-intermediate@sanh09-skills
```

설치한 뒤 Claude Code를 다시 켜고, 배우고 싶은 내용을 말하거나 `/cc-intermediate:cc-intermediate`을 입력하세요.

## 내 컴퓨터에서 하는 일

- 스킬 하나(지침과 참고 파일)만 추가합니다. 훅, MCP 서버, 스크립트는 없고, 네트워크로 아무것도 보내지 않습니다.
- 동의하면 학습 기록을 `~/.claude/cc-tutor-progress.md`(세 과정이 같이 쓰는 작은 텍스트 파일)에 남깁니다. 언제든 지워도 되고, 동의하지 않으면 아무것도 저장하지 않습니다.
- 실습은 `CLAUDE.md` 만들기처럼 학습자가 고른 프로젝트에서 직접 해 보는 단계입니다. 처음에는 연습용 폴더에서 해 보세요.

## 출처와 라이선스

소스, 업데이트 내역, 다른 과정: https://github.com/sanh09/code-guide-protocol

라이선스: MIT. [LICENSE](LICENSE)를 보세요.
