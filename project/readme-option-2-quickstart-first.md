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

`kagi` brings Kagi into the terminal with a command surface that works for quick human use and scriptable JSON output.

Full documentation: [`kagi.micr.dev`](https://kagi.micr.dev)

## 60-second quickstart

Install:

```bash
curl -fsSL https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.sh | sh
kagi --help
```

Run something immediately:

```bash
kagi news --category world --limit 3
kagi smallweb --limit 3
```

Add your Kagi session link when you want subscriber features:

```bash
kagi auth set --session-token 'https://kagi.com/search?token=...'
kagi auth check
kagi search --pretty "local-first apps"
kagi summarize --subscriber --url https://kagi.com
```

Add an API token if you use Kagi's paid API:

```bash
export KAGI_API_TOKEN='...'
kagi summarize --url https://example.com
kagi fastgpt "summarize the latest postgres release themes"
kagi enrich news "browser privacy"
```

## why people use it

- one CLI for Kagi search, feeds, summarization, and AI commands
- accepts a full Kagi session-link URL, not just the raw token
- JSON on stdout by default, with `--pretty` when you want terminal-friendly rendering
- no-auth public feeds for `news` and `smallweb`

## install options

Homebrew:

```bash
brew tap Microck/kagi
brew install kagi
```

npm, pnpm, or bun:

```bash
npm install -g kagi-cli
pnpm add -g kagi-cli
bun add -g kagi-cli
kagi --help
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/Microck/kagi-cli/main/scripts/install.ps1 | iex
kagi --help
```

Scoop:

```powershell
scoop bucket add kagi https://github.com/Microck/scoop-kagi
scoop install kagi
```

## the auth model

- `KAGI_SESSION_TOKEN` is the subscriber path for `assistant`, `search --lens`, and `summarize --subscriber`
- `KAGI_API_TOKEN` is the paid API path for `fastgpt`, `enrich`, and public `summarize`
- base `search` prefers the API token when available and can fall back to the session token
- environment variables override `.kagi.toml`

## where to go next

- [quickstart guide](https://kagi.micr.dev/guides/quickstart)
- [authentication guide](https://kagi.micr.dev/guides/authentication)
- [common workflows](https://kagi.micr.dev/guides/workflows)
- [search command reference](https://kagi.micr.dev/commands/search)
- [auth matrix](https://kagi.micr.dev/reference/auth-matrix)

## project links

- [GitHub repository](https://github.com/Microck/kagi-cli)
- [contributing](../CONTRIBUTING.md)
- [support](../SUPPORT.md)
- [security](../SECURITY.md)
- [license](../LICENSE)
