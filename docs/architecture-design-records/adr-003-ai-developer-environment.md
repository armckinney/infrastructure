# ADR 003: Replicating AI Developer Environments

* **Status**: Accepted
* **Date**: 2026-07-06
* **Author**: Agent

## Context

As the repository and developer tooling evolve, standardizing the local AI developer environments ensures that both human maintainers and autonomous AI agents have access to consistent instructions, modular tasks, and rule files. Without standard configurations, AI agents may lack the context required to make design decisions, perform context mapping, or conform to repository standards.

## Decision

We will adopt the AI Developer Environment architecture details specified in [docs/architecture/ai.md](file:///workspaces/infrastructure/docs/architecture/ai.md).
Specifically, we will:
* Configure Dev Container Features in [.devcontainer/devcontainer.json](file:///workspaces/infrastructure/.devcontainer/devcontainer.json) for both Copilot and Antigravity features with settings pointing to the global rules file, path-scoped context instructions, and modular skills directories.
* Maintain global rules in the master file [docs/agents/AGENTS.md](file:///workspaces/infrastructure/docs/agents/AGENTS.md) and use relative symlinks for propagation.
* Store path-scoped instructions in [docs/agents/context/](file:///workspaces/infrastructure/docs/agents/context/) to apply guidelines conditionally based on active file globs.
* Define modular tasks and reusable behaviors as executable skills in [docs/agents/skills/](file:///workspaces/infrastructure/docs/agents/skills/) using the `SKILL.md` format.

## Consequences

* **Positive**:
  * AI developer settings (rules, context, skills) are fully defined and source-controlled in the repository.
  * Context loading is scoped and modular, improving prompt token efficiency and reducing noise.
  * Reusable skills (like ADR creation and guidelines) are easily executable by AI tools.
* **Neutral/Negative**:
  * Slight overhead to maintain path-scoped files and skills when repository layouts change.
