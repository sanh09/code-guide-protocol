# codeguide-basics: Claude Code 기초 튜터

[English](README.md) | **한국어**

Claude Code를 처음 쓰는 사람을 위한 단계별 튜터입니다. 짧은 설명, 내 터미널에서 해 보는 실습, 퀴즈로 가르치고, 학습자가 쓰는 언어(한국어, 영어, 일본어 등)로 답합니다. 코딩 경험이 없어도 됩니다.

## 레슨

1. Claude Code와 첫 대화
2. 입력 기호(`/` `!` `@`)와 단축키
3. 대화 관리 명령(`/clear`, `/compact`, `/resume`, `/rewind`)
4. 권한과 모드
5. `CLAUDE.md`로 Claude에게 프로젝트 알려주기
6. `settings.json`으로 설정하기

## 시작하기

대화를 시작하고 배우고 싶은 내용을 말하세요. 예:

- "클로드 코드 처음이에요. 처음부터 알려주세요"
- "/compact가 뭐예요?"
- "CLAUDE.md 퀴즈 내주세요"

메뉴 경로·명령어·설정은 공식 문서로 확인해 `skills/cc-basics/references/facts.md`에 정리했습니다. 퀴즈 정답은 별도 파일에 두고 채점할 때만 읽으므로, 답하기 전에 보이지 않습니다.

## 설치

Claude Code에서:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install codeguide-basics@sanh09-skills
```

이 플러그인에는 스킬 `cc-basics`가 들어 있습니다. 설치한 뒤 Claude Code를 다시 켜고, 배우고 싶은 내용을 말하거나 `/codeguide-basics:cc-basics`을 입력하세요.

## 내 컴퓨터에서 하는 일

- 스킬 하나(지침과 참고 파일)만 추가합니다. 훅, MCP 서버, 스크립트는 없고, 네트워크로 아무것도 보내지 않습니다.
- 동의하면 학습 기록을 `~/.claude/cc-tutor-progress.md`(세 과정이 같이 쓰는 작은 텍스트 파일)에 남깁니다. 언제든 지워도 되고, 동의하지 않으면 아무것도 저장하지 않습니다.
- 실습은 `CLAUDE.md` 만들기처럼 학습자가 고른 프로젝트에서 직접 해 보는 단계입니다. 처음에는 연습용 폴더에서 해 보세요.

## 출처와 라이선스

소스, 업데이트 내역, 다른 과정: https://github.com/sanh09/code-guide-protocol

라이선스: 코드(스크립트·JSON 파일)는 MIT([LICENSE](LICENSE)), 내용(스킬 문서·레슨·퀴즈)은 CC BY 4.0([LICENSE-CC-BY-4.0](LICENSE-CC-BY-4.0))입니다. 자세한 범위와 출처 표시 방법은 [NOTICE](NOTICE)를 보세요.
