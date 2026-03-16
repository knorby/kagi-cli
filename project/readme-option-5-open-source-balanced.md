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

`kagi` is a Rust CLI for Kagi subscribers, paid API users, and automation-heavy terminal workflows. It wraps search, feeds, AI commands, and summarization behind a single command surface with JSON-first output.

Documentation: [`kagi.micr.dev`](https://kagi.micr.dev)

## features

- search Kagi from the terminal with JSON output by default and `--pretty` when you want formatted results
- use a full session-link URL for subscriber auth setup
- run subscriber features like `assistant`, `search --lens`, and `summarize --subscriber`
- run paid API commands like `fastgpt`, public `summarize`, and `enrich`
- access public feeds like `news` and `smallweb` without credentials

## installation

Install with the shell script:

```bash
curl -fsSL https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.sh | sh
kagi --help
```

Install with package managers:

```bash
brew tap Microck/kagi
brew install kagi

npm install -g kagi-cli
pnpm add -g kagi-cli
bun add -g kagi-cli
```

Install from source:

```bash
cargo install --path .
kagi --help
```

Windows:

```powershell
irm https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.ps1 | iex
```

## usage

No auth required:

```bash
kagi news --category tech --limit 3
kagi smallweb --limit 3
```

Subscriber setup:

```bash
kagi auth set --session-token 'https://kagi.com/search?token=...'
kagi auth check
kagi search --pretty "local-first development tools"
kagi assistant "give me a short research plan for browser privacy"
```

Paid API setup:

```bash
export KAGI_API_TOKEN='...'
kagi summarize --url https://example.com
kagi fastgpt "what should a good cli readme include?"
kagi enrich web "terminal search workflows"
```

## authentication

| token | used for |
| --- | --- |
| `KAGI_SESSION_TOKEN` | subscriber search flows, lenses, Assistant, `summarize --subscriber` |
| `KAGI_API_TOKEN` | public paid API commands like `summarize`, `fastgpt`, and `enrich` |
| none | `news`, `smallweb`, `auth status` |

Notes:

- `kagi auth set --session-token` accepts a raw token or the full session-link URL
- base `kagi search` uses the API token when available and can fall back to the session token
- environment variables override `.kagi.toml`

## command reference

- [search](https://kagi.micr.dev/commands/search)
- [auth](https://kagi.micr.dev/commands/auth)
- [summarize](https://kagi.micr.dev/commands/summarize)
- [news](https://kagi.micr.dev/commands/news)
- [smallweb](https://kagi.micr.dev/commands/smallweb)
- [assistant](https://kagi.micr.dev/commands/assistant)
- [fastgpt](https://kagi.micr.dev/commands/fastgpt)
- [enrich](https://kagi.micr.dev/commands/enrich)

## more docs

- [quickstart](https://kagi.micr.dev/guides/quickstart)
- [authentication guide](https://kagi.micr.dev/guides/authentication)
- [workflows](https://kagi.micr.dev/guides/workflows)
- [advanced usage](https://kagi.micr.dev/guides/advanced-usage)
- [auth matrix](https://kagi.micr.dev/reference/auth-matrix)
- [output contract](https://kagi.micr.dev/reference/output-contract)

## project

- [GitHub repository](https://github.com/Microck/kagi-cli)
- [contributing](../CONTRIBUTING.md)
- [support](../SUPPORT.md)
- [security](../SECURITY.md)
- [license](../LICENSE)
