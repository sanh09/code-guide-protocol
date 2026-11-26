# codeguide-advanced: Claude Code Advanced tutor

**English** | [한국어](README.ko.md)

A tutor for extending and automating Claude Code: choosing between CLAUDE.md, skills, hooks, subagents, MCP, and plugins, then building and publishing your own. It teaches with tutorials, hands-on exercises, and quizzes, and it replies in the language you write in.

## Lessons

1. A map of the extension features
2. Connecting MCP servers
3. Custom subagents
4. Hooks
5. Skills in depth, and building and publishing plugins
6. Automation: `-p`, `--bare`, CI, and GitHub Actions
7. Parallel work and review patterns (worktrees)

## Before you start

The tutor checks that you finished the Intermediate course (`cc-intermediate`). With development experience, passing the Intermediate check quiz (4 of 5 correct) is also enough. Without it, take Basics and then Intermediate first.

## How to start

Start a conversation and say what you want to learn, for example:

- "How do I connect an MCP server?"
- "I want to set up hooks"
- "How do I build and publish a plugin?"

Menu paths, commands, and settings are checked against the official documentation and kept in `skills/cc-advanced/references/facts.md`. Quiz answers are kept in a separate file and read only when grading, so they are not shown before you answer.

## Install

In Claude Code:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install codeguide-advanced@sanh09-skills
```

The plugin contains one skill, `cc-advanced`. Then restart Claude Code and say what you want to learn, or type `/codeguide-advanced:cc-advanced`.

## What it does on your machine

- It adds one skill: instructions and reference files. It has no hooks, MCP servers, or scripts, and it sends nothing over the network.
- With your consent, it writes your progress to `~/.claude/cc-tutor-progress.md`, a small text file shared by the three courses. You can delete it at any time. If you say no, nothing is saved.
- Exercises are steps you try yourself in a project you choose, such as creating a `CLAUDE.md` file. A practice folder is a good place to start.

## Source and license

Source, release notes, and other courses: https://github.com/sanh09/code-guide-protocol

License: code (scripts and JSON files) under MIT, see [LICENSE](LICENSE); content (skill text, lessons, quizzes) under CC BY 4.0, see [LICENSE-CC-BY-4.0.txt](LICENSE-CC-BY-4.0.txt). Details and how to give credit: [NOTICE.txt](NOTICE.txt).
