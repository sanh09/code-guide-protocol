# cc-basics: Claude Code Basics tutor

**English** | [한국어](README.ko.md)

A step-by-step tutor for complete beginners to Claude Code. It teaches with short tutorials, hands-on exercises you do in your own terminal, and quizzes, and it replies in the language you write in (English, Korean, Japanese, and so on). No prior coding experience is needed.

## Lessons

1. Your first conversation with Claude Code
2. Input prefixes (`/` `!` `@`) and keyboard shortcuts
3. Commands for managing a conversation (`/clear`, `/compact`, `/resume`, `/rewind`)
4. Permissions and modes
5. Telling Claude about your project with `CLAUDE.md`
6. Configuring Claude Code with `settings.json`

## How to start

Start a conversation and say what you want to learn, for example:

- "I'm new to Claude Code. Teach me from the start"
- "What does /compact do?"
- "Give me a CLAUDE.md quiz"

Menu paths, commands, and settings are checked against the official documentation and kept in `skills/cc-basics/references/facts.md`. Quiz answers are kept in a separate file and read only when grading, so they are not shown before you answer.

## Install

In Claude Code:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install cc-basics@sanh09-skills
```

Then restart Claude Code and say what you want to learn, or type `/cc-basics:cc-basics`.

## What it does on your machine

- It adds one skill: instructions and reference files. It has no hooks, MCP servers, or scripts, and it sends nothing over the network.
- With your consent, it writes your progress to `~/.claude/cc-tutor-progress.md`, a small text file shared by the three courses. You can delete it at any time. If you say no, nothing is saved.
- Exercises are steps you try yourself in a project you choose, such as creating a `CLAUDE.md` file. A practice folder is a good place to start.

## Source and license

Source, release notes, and other courses: https://github.com/sanh09/code-guide-protocol

License: MIT. See [LICENSE](LICENSE).
