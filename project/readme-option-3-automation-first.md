<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="../.github/assets/kagi-cli-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="../.github/assets/kagi-cli-logo-light.svg">
    <img src="../.github/assets/kagi-cli-logo-light.svg" alt="kagi cli" width="720">
  </picture>
</p>

<p align="center">
  use kagi from your terminal with your session-link url, or drop in an api token when you want the paid api commands too.
</p>

<p align="center">
  <a href="https://github.com/Microck/kagi-cli/releases"><img src="https://img.shields.io/github/v/release/Microck/kagi-cli?display_name=tag&style=flat-square&label=release&color=000000" alt="release badge"></a>
  <a href="https://github.com/Microck/kagi-cli/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/Microck/kagi-cli/ci.yml?branch=main&style=flat-square&label=ci&color=000000" alt="ci badge"></a>
  <a href="../LICENSE"><img src="https://img.shields.io/badge/license-mit-000000?style=flat-square" alt="license badge"></a>
</p>

---

# kagi

`kagi` is an automation-first CLI for Kagi. It keeps stdout structured, avoids interactive setup requirements, and still gives you `--pretty` when you want to read results directly in the terminal.

Docs: [`kagi.micr.dev`](https://kagi.micr.dev)

## why this shape works well in scripts

- JSON-first output for piping into `jq`, agents, and shell workflows
- one command surface across search, feeds, summarization, and AI endpoints
- public commands that work without credentials for smoke tests and demos
- explicit credential split between subscriber features and paid API features

## install

```bash
curl -fsSL https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.sh | sh
kagi --version
kagi --help
```

Alternative installs:

```bash
brew tap Microck/kagi
brew install kagi

npm install -g kagi-cli
pnpm add -g kagi-cli
bun add -g kagi-cli
```

## examples that fit automation

Smoke test with no auth:

```bash
kagi news --limit 1 | jq .
kagi smallweb --limit 2 | jq .
```

Search pipeline:

```bash
export KAGI_SESSION_TOKEN='https://kagi.com/search?token=...'
kagi search "rust release notes" | jq -r '.data[0].url'
```

Pretty search for humans, same command surface:

```bash
kagi search --pretty "rust release notes"
```

Subscriber-only flows:

```bash
kagi search --lens 2 "developer documentation"
kagi assistant "outline a shell workflow for weekly research"
kagi summarize --subscriber --url https://kagi.com
```

Paid API flows:

```bash
export KAGI_API_TOKEN='...'
kagi summarize --url https://example.com | jq .
kagi fastgpt "what are the main sqlite WAL tradeoffs?"
kagi enrich web "local-first software"
```

## auth behavior

| credential | enables |
| --- | --- |
| `KAGI_SESSION_TOKEN` | subscriber search flows, `search --lens`, `assistant`, `summarize --subscriber` |
| `KAGI_API_TOKEN` | public paid API commands like `summarize`, `fastgpt`, and `enrich` |
| none | `news`, `smallweb`, `auth status` |

Base `kagi search` uses the API token when available and can fall back to the session token. Environment variables override `.kagi.toml`.

## docs worth bookmarking

- [quickstart](https://kagi.micr.dev/guides/quickstart)
- [advanced usage](https://kagi.micr.dev/guides/advanced-usage)
- [output contract](https://kagi.micr.dev/reference/output-contract)
- [auth matrix](https://kagi.micr.dev/reference/auth-matrix)
- [error reference](https://kagi.micr.dev/reference/error-reference)

## command map

- [search](https://kagi.micr.dev/commands/search)
- [auth](https://kagi.micr.dev/commands/auth)
- [summarize](https://kagi.micr.dev/commands/summarize)
- [assistant](https://kagi.micr.dev/commands/assistant)
- [fastgpt](https://kagi.micr.dev/commands/fastgpt)
- [enrich](https://kagi.micr.dev/commands/enrich)
- [news](https://kagi.micr.dev/commands/news)
- [smallweb](https://kagi.micr.dev/commands/smallweb)

## project links

- [GitHub repository](https://github.com/Microck/kagi-cli)
- [releases](https://github.com/Microck/kagi-cli/releases)
- [development docs](https://kagi.micr.dev/project/development)
- [support docs](https://kagi.micr.dev/project/support)
- [license](../LICENSE)
