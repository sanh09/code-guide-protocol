# codeguide-advanced: Claude Code 고급 튜터

[English](README.md) | **한국어**

Claude Code를 확장하고 자동화하는 법을 가르치는 튜터입니다. CLAUDE.md·스킬·훅·서브에이전트·MCP·플러그인 중 무엇을 고를지부터 직접 만들어 배포하는 법까지 튜토리얼·실습·퀴즈로 다루고, 학습자가 쓰는 언어로 답합니다.

## 레슨

1. 확장 기능 지도
2. MCP 서버 연결
3. 커스텀 서브에이전트
4. 훅(hooks)
5. 스킬 심화와 플러그인 제작·배포
6. 자동화: `-p`, `--bare`, CI, GitHub Actions
7. 병렬 작업과 리뷰 패턴(worktree)

## 시작하기 전에

튜터가 중급 과정(`cc-intermediate`)을 마쳤는지 확인합니다. 개발 경험이 있으면 중급 확인 퀴즈(5문제 중 4문제 이상)를 통과해도 됩니다. 개발 경험이 없으면 기초와 중급을 먼저 마쳐야 합니다.

## 시작하기

대화를 시작하고 배우고 싶은 내용을 말하세요. 예:

- "MCP 서버 연결하는 법"
- "훅 설정하고 싶어요"
- "플러그인 만들어서 배포하기"

메뉴 경로·명령어·설정은 공식 문서로 확인해 `skills/cc-advanced/references/facts.md`에 정리했습니다. 퀴즈 정답은 별도 파일에 두고 채점할 때만 읽으므로, 답하기 전에 보이지 않습니다.

## 설치

Claude Code에서:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install codeguide-advanced@sanh09-skills
```

이 플러그인에는 스킬 `cc-advanced`가 들어 있습니다. 설치한 뒤 Claude Code를 다시 켜고, 배우고 싶은 내용을 말하거나 `/codeguide-advanced:cc-advanced`을 입력하세요.

## 내 컴퓨터에서 하는 일

- 스킬 하나(지침과 참고 파일)만 추가합니다. 훅, MCP 서버, 스크립트는 없고, 네트워크로 아무것도 보내지 않습니다.
- 동의하면 학습 기록을 `~/.claude/cc-tutor-progress.md`(세 과정이 같이 쓰는 작은 텍스트 파일)에 남깁니다. 언제든 지워도 되고, 동의하지 않으면 아무것도 저장하지 않습니다.
- 실습은 `CLAUDE.md` 만들기처럼 학습자가 고른 프로젝트에서 직접 해 보는 단계입니다. 처음에는 연습용 폴더에서 해 보세요.

## 출처와 라이선스

소스, 업데이트 내역, 다른 과정: https://github.com/sanh09/code-guide-protocol

라이선스: MIT. [LICENSE](LICENSE)를 보세요.
