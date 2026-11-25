# cc-intermediate: Claude Code Intermediate tutor

**English** | [한국어](README.ko.md)

A tutor for using Claude Code in real development work: writing good requests, the explore → plan → implement → commit workflow, and the features that keep long sessions under control. It teaches with tutorials, hands-on exercises, and quizzes, and it replies in the language you write in.

## Lessons

1. Writing good requests
2. Explore → plan → implement → commit (plan mode)
3. Working with git, pull requests, and checkpoints
4. Permission rules in depth (allow, ask, deny)
5. Making your own slash commands (skills)
6. Managing sessions and context
7. Non-interactive runs with `claude -p`

## Before you start

The tutor first asks about your development experience. With experience, you start right away. Without it, it checks that you finished the Basics course (`cc-basics`), using a short check quiz (4 of 5 correct) if there is no record, and sends you to Basics if you haven't taken it.

## How to start

Start a conversation and say what you want to learn, for example:

- "Start the Claude Code intermediate course"
- "How do I use plan mode well?"
- "How do I write permission rules?"

Menu paths, commands, and settings are checked against the official documentation and kept in `skills/cc-intermediate/references/facts.md`. Quiz answers are kept in a separate file and read only when grading, so they are not shown before you answer.

## Install

In Claude Code:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install cc-intermediate@sanh09-skills
```

Then restart Claude Code and say what you want to learn, or type `/cc-intermediate:cc-intermediate`.

## What it does on your machine

- It adds one skill: instructions and reference files. It has no hooks, MCP servers, or scripts, and it sends nothing over the network.
- With your consent, it writes your progress to `~/.claude/cc-tutor-progress.md`, a small text file shared by the three courses. You can delete it at any time. If you say no, nothing is saved.
- Exercises are steps you try yourself in a project you choose, such as creating a `CLAUDE.md` file. A practice folder is a good place to start.

## Source and license

Source, release notes, and other courses: https://github.com/sanh09/code-guide-protocol

License: MIT. See [LICENSE](LICENSE).
