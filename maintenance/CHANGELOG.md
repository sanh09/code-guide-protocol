# 자동 업데이트 기록

최신 항목이 위에 옵니다. 각 항목: 날짜 · 확인한 버전 · 바꾼 내용 · 바꾼 저장소.

## 2026-11-25 (저장소 정리)
- `ai-chat-guide-ko`를 guide-protocol에서 빼고 app-guide-plugin에서만 관리. guide-protocol README에는 링크를 남김.
- `ai-chat-guide-ko` 프로젝트 사실 수정: Free를 포함한 모든 사용자가 사용, Free는 최대 5개. 프로젝트 지침의 '(유료)' 표기를 '요금제에 따라 다를 수 있음'으로 바꿈. 버전 0.3.1.
- plugin.json keywords의 `korean`을 `multilingual`로 바꿈. README 업데이트 내역에 다국어 항목 추가.
- 저장소: code-guide-protocol, guide-protocol, app-guide-plugin.

## 2026-11-25 (다국어 응답)
- 모든 튜터가 학습자가 쓰는 언어로 답하도록 바꿈(참고 파일은 한국어 유지, 응답할 때 학습자 언어로 옮김). 퀴즈는 옮겨도 보기 뜻을 유지하고, 채점은 뜻으로 대조.
- description에 영어 트리거 문장 추가, 제목·README의 '한국어' 표기 정리. 스킬 이름(-ko)은 유지.
- 버전: cc-basics-ko 0.4.0, cc-intermediate-ko 0.3.0, cc-advanced-ko 0.3.0, ai-chat-guide-ko(app-guide-plugin) 0.3.0.
- 저장소: code-guide-protocol, guide-protocol, app-guide-plugin.

## 2026-11-25 (퀴즈 정답 노출 수정)
- 문제 은행의 정답을 `references/quiz-answers.md`로 분리(보기 내용으로 기록), 채점할 때만 읽게 함.
- 모든 SKILL.md에 정답 노출 방지 규칙 추가: 보기 순서 섞기, 답 형식 예시는 `1-?`만, 선택형 질문 도구로 퀴즈 내지 않기, 보내기 전 점검.
- Claude Code 버전: 입력창 자동 제안(Prompt suggestions)에 정답이 뜰 수 있음을 안내하고 끄는 법 추가(facts.md에도 추가).
- 버전: cc-basics-ko 0.3.0, cc-intermediate-ko 0.2.0, cc-advanced-ko 0.2.0, ai-chat-guide-ko(app-guide-plugin) 0.2.0.
- 저장소: code-guide-protocol, guide-protocol, app-guide-plugin.

## 2026-11-25
- 기준 상태 기록: Claude Code 2.1.331, Claude 앱 릴리스 노트 2026-11-25까지 확인.
