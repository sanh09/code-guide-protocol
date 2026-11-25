# code-guide-protocol: Claude Code courses (Basics · Intermediate · Advanced)

**English** | [한국어](README.ko.md)

> **Reply language**: every tutor replies in the language the learner writes in (English, Korean, Japanese, and so on). The `-ko` suffix in the skill names is kept from the original names so that existing installs keep working.

Tutor skills that teach Claude Code **one step at a time**. Each course is made of tutorials, hands-on exercises, and quizzes.

| Course | Plugin | For | Covers |
|---|---|---|---|
| Basics | `cc-basics-ko` | People new to the terminal and coding | First conversation, input prefixes (`/` `!` `@`) and shortcuts, managing a conversation (`/clear` `/compact` `/resume` `/rewind`), permissions and modes, `CLAUDE.md`, `settings.json` |
| Intermediate | `cc-intermediate-ko` | Developers, or people who finished Basics | Writing good requests, explore → plan → implement → commit (plan mode), git, PRs and checkpoints, permission rules in depth, your own slash commands (skills), session and context management, `claude -p` |
| Advanced | `cc-advanced-ko` | People who finished Intermediate or passed its check quiz | Choosing an extension type, MCP, subagents, hooks, building and publishing skills and plugins, `--bare`, CI and GitHub Actions automation, parallel work with worktrees and review |

## Level checks (Intermediate and Advanced)

- **Intermediate**: asks about your development experience first. With experience, you start right away. Without it, the tutor checks that you finished Basics and sends you to Basics if you haven't. If you finished it but there is no record, a check quiz (4 of 5 correct) confirms it.
- **Advanced**: checks that you finished Intermediate. With development experience, passing the Intermediate check quiz is also enough. Without it, finish Basics and then Intermediate first.
- With your consent, progress is saved to `~/.claude/cc-tutor-progress.md`, shared by the three courses.

Commands, paths, and settings are checked against the official docs (https://code.claude.com/docs) and kept in each skill's `references/facts.md` (as of 2026-11).

## Install

Inside Claude Code:

```
/plugin marketplace add sanh09/code-guide-protocol
/plugin install cc-basics-ko@sanh09-skills
/plugin install cc-intermediate-ko@sanh09-skills
/plugin install cc-advanced-ko@sanh09-skills
```

Or from a terminal:

```bash
claude plugin marketplace add sanh09/code-guide-protocol
claude plugin install cc-basics-ko@sanh09-skills
claude plugin install cc-intermediate-ko@sanh09-skills
claude plugin install cc-advanced-ko@sanh09-skills
```

You can install only the courses you need.

### Install with curl (no plugin; macOS, Linux, WSL)

One line installs all three courses into `~/.claude/skills/`.

```bash
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash
```

To pick courses or change the location, add arguments after `bash -s --`.

```bash
# Basics and Intermediate only
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- basics intermediate

# Into .claude/skills/ of the current folder (project), to share with your team through git
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- --project

# Uninstall
curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | bash -s -- --uninstall
```

| Argument | Meaning |
|---|---|
| `basics` `intermediate` `advanced` | Courses to install (one or more) |
| `all` | All three courses (default) |
| `--project` | Install into `.claude/skills/` of the current folder instead of `~/.claude/skills/` |
| `--uninstall` | Delete the installed skill folders (your progress record stays) |

- Update: run the same command again to overwrite with the latest version.
- After installing, restart Claude Code and call `/cc-basics-ko`, `/cc-intermediate-ko`, or `/cc-advanced-ko`, or just ask in your own words.
- Use **either** the plugin or curl, not both. With both, the same skill shows up twice.
- You can read the script before running it: `curl -fsSL https://raw.githubusercontent.com/sanh09/code-guide-protocol/main/install.sh | less`
- On Windows, run it in WSL or Git Bash, or use the plugin method above.

## Using it in the Claude web or desktop app

The skills in this repository are **for Claude Code only**. To learn in a chat in the Claude web app (claude.ai) or desktop app, use the app versions: https://github.com/sanh09/guide-protocol

## Usage

Say something like this in Claude Code and the right skill starts:

- Basics: "I'm new to Claude Code. Teach me from the start", "Give me a CLAUDE.md quiz"
- Intermediate: "Start the Claude Code intermediate course", "How do I use plan mode well?", "How do I write permission rules?"
- Advanced: "How do I connect an MCP server?", "I want to set up hooks", "How do I build and publish a plugin?"

To call a skill directly, type `/cc-basics-ko:cc-basics-ko`, `/cc-intermediate-ko:cc-intermediate-ko`, or `/cc-advanced-ko:cc-advanced-ko` if you installed the plugins, or `/cc-basics-ko`, `/cc-intermediate-ko`, `/cc-advanced-ko` if you installed with curl.

## What the plugins do on your machine

- They only add skills (instructions and reference files). There are no hooks, MCP servers, or scripts, and nothing is sent over the network.
- The only file they write is the progress record `~/.claude/cc-tutor-progress.md`, and only after you agree. You can delete it at any time.
- Hands-on exercises are things you run yourself in your own project, such as creating a `CLAUDE.md` file.

## Structure

```
install.sh                             curl install script
.claude-plugin/marketplace.json        marketplace definition (sanh09-skills)
plugins/
  cc-basics-ko/                        Basics
  cc-intermediate-ko/                  Intermediate
  cc-advanced-ko/                      Advanced
    .claude-plugin/plugin.json
    README.md, README.ko.md, LICENSE
    skills/<name>/
      SKILL.md                         tutor rules
      references/curriculum.md         lessons, exercises, quiz bank
      references/quiz-answers.md       quiz answer key (read only when grading)
      references/facts.md              facts checked against the official docs
      references/gating.md             level check (Intermediate, Advanced)
      evals/                           test cases (claude plugin eval format)
```

## Tests

Run this in a skill folder to compare the test cases with and without the skill (it calls the model, so it costs usage):

```bash
cd plugins/cc-intermediate-ko/skills/cc-intermediate-ko
claude plugin eval . --allow-tools Write,Edit,Bash
```

## Release notes

### 2026-11-25: English README and license
- The README is now in English by default, with the Korean version in [README.ko.md](README.ko.md). Each plugin folder has its own README and LICENSE.

### 2026-11-25: Replies in the learner's language
- Every tutor replies in the language the learner writes in (English, Korean, Japanese, and so on). The reference files stay in Korean and are translated when the tutor replies.
- Translated quizzes keep the meaning of each option, and grading compares meanings.
- Versions: `cc-basics-ko` 0.4.0, `cc-intermediate-ko` 0.3.0, `cc-advanced-ko` 0.3.0
- Update the same way as below.

### 2026-11-25: Quiz answers no longer leak
- Fixed quiz answers showing up in the question, examples, or hints. Answers now live in `references/quiz-answers.md` and are read only when grading.
- Options are shuffled every time, and answer-format examples use placeholders only, such as `1-?, 2-?`.
- Claude Code's grey prompt suggestions in the input box can show an answer, so the first quiz explains this and how to turn them off in `/config`.
- Versions: `cc-basics-ko` 0.3.0, `cc-intermediate-ko` 0.2.0, `cc-advanced-ko` 0.2.0

**How to update**
- Plugins: run these in a terminal, then restart Claude Code.
  ```bash
  claude plugin marketplace update sanh09-skills
  claude plugin update cc-basics-ko@sanh09-skills
  claude plugin update cc-intermediate-ko@sanh09-skills
  claude plugin update cc-advanced-ko@sanh09-skills
  ```
- curl install: run the install command again.

Full change log: [`maintenance/CHANGELOG.md`](maintenance/CHANGELOG.md)

## Contributing

Changes go through pull requests, not direct pushes to `main`. Make a branch, edit, and merge the PR once checks such as `claude plugin validate .` pass. The automatic updates follow the same flow. Details: [MAINTENANCE.md](maintenance/MAINTENANCE.md)

## Maintenance

The update procedure for Claude and Claude Code releases, and its records, are in [`maintenance/`](maintenance/MAINTENANCE.md). It covers all three repositories (code-guide-protocol, guide-protocol, app-guide-plugin).

## License

See the `LICENSE` file in each plugin folder.
