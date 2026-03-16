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

If you already use Kagi as a subscriber, `kagi` is the shortest path from your session link to terminal search, lenses, Assistant, and subscriber summarization.

Canonical docs: [`kagi.micr.dev`](https://kagi.micr.dev)

## the main path

Paste your full Kagi session-link URL and let the CLI extract the token for you:

```bash
kagi auth set --session-token 'https://kagi.com/search?token=...'
kagi auth check
```

Then use the subscriber features people usually want first:

```bash
kagi search --pretty "privacy-first browsers"
kagi search --lens 2 "developer documentation"
kagi assistant "plan a focused research session in the terminal"
kagi summarize --subscriber --url https://kagi.com
```

## why subscriber auth is the nicest default

- `kagi auth set --session-token` accepts the full session-link URL
- lens search works directly from the CLI
- Assistant threads stay available in the terminal
- subscriber summarizer is available without switching tools
- you can still add an API token later for paid API-only commands

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

## optional api token

If you also pay for Kagi API access, add `KAGI_API_TOKEN` for commands that live on the public API side:

```bash
export KAGI_API_TOKEN='...'
kagi summarize --url https://example.com
kagi fastgpt "compare zig and rust for cli tooling"
kagi enrich news "search startups"
```

That token is for `summarize`, `fastgpt`, and `enrich`. Subscriber-only commands like `assistant`, `search --lens`, and `summarize --subscriber` still use `KAGI_SESSION_TOKEN`.

## the no-auth commands

Even without auth, these still work:

```bash
kagi news --category tech --limit 3
kagi smallweb --limit 3
```

## docs map

- [quickstart](https://kagi.micr.dev/guides/quickstart)
- [authentication](https://kagi.micr.dev/guides/authentication)
- [search](https://kagi.micr.dev/commands/search)
- [assistant](https://kagi.micr.dev/commands/assistant)
- [summarize](https://kagi.micr.dev/commands/summarize)
- [auth matrix](https://kagi.micr.dev/reference/auth-matrix)

## project links

- [GitHub repository](https://github.com/Microck/kagi-cli)
- [releases](https://github.com/Microck/kagi-cli/releases)
- [contributing](../CONTRIBUTING.md)
- [support](../SUPPORT.md)
- [license](../LICENSE)
