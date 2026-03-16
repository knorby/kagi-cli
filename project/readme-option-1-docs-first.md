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

`kagi` is a Rust CLI for Kagi search, feeds, summarization, and AI workflows with JSON-first output by default.

Docs live at [`kagi.micr.dev`](https://kagi.micr.dev). Use this README as the short GitHub landing page, then jump to the docs for the full guide.

## start here

- [installation](https://kagi.micr.dev/guides/installation)
- [quickstart](https://kagi.micr.dev/guides/quickstart)
- [authentication](https://kagi.micr.dev/guides/authentication)
- [workflows](https://kagi.micr.dev/guides/workflows)
- [advanced usage](https://kagi.micr.dev/guides/advanced-usage)

## what it covers

- `search` for structured Kagi results
- `assistant` for subscriber AI conversations
- `summarize` for public API or subscriber summarizer flows
- `fastgpt` and `enrich` for paid API usage
- `news` and `smallweb` for public feeds with no auth

## install

macOS and Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.sh | sh
kagi --help
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.ps1 | iex
kagi --help
```

Package managers:

```bash
brew tap Microck/kagi
brew install kagi

npm install -g kagi-cli
pnpm add -g kagi-cli
bun add -g kagi-cli
```

The npm package is `kagi-cli`, but the installed command is `kagi`.

## fastest first commands

No auth required:

```bash
kagi news --category tech --limit 3
kagi smallweb --limit 3
```

Subscriber session token:

```bash
kagi auth set --session-token 'https://kagi.com/search?token=...'
kagi auth check
kagi search --pretty "privacy focused search tools"
kagi assistant "give me 3 ways to use kagi from the terminal"
```

Paid API token:

```bash
export KAGI_API_TOKEN='...'
kagi summarize --url https://example.com
kagi fastgpt "what changed in rust 1.86?"
kagi enrich web "kagi search cli"
```

## auth at a glance

- `KAGI_SESSION_TOKEN` unlocks subscriber-only flows like `assistant`, `search --lens`, and `summarize --subscriber`
- `KAGI_API_TOKEN` unlocks public paid API commands like `fastgpt`, `enrich`, and public `summarize`
- base `kagi search` uses the API token when available and can fall back to the session token
- `news` and `smallweb` do not require auth

For the full command-to-token matrix, see [`/reference/auth-matrix`](https://kagi.micr.dev/reference/auth-matrix).

## command reference

- [search](https://kagi.micr.dev/commands/search)
- [auth](https://kagi.micr.dev/commands/auth)
- [summarize](https://kagi.micr.dev/commands/summarize)
- [news](https://kagi.micr.dev/commands/news)
- [smallweb](https://kagi.micr.dev/commands/smallweb)
- [assistant](https://kagi.micr.dev/commands/assistant)
- [fastgpt](https://kagi.micr.dev/commands/fastgpt)
- [enrich](https://kagi.micr.dev/commands/enrich)

## project links

- [GitHub repository](https://github.com/Microck/kagi-cli)
- [releases](https://github.com/Microck/kagi-cli/releases)
- [contributing](../CONTRIBUTING.md)
- [support](../SUPPORT.md)
- [security](../SECURITY.md)
- [license](../LICENSE)
