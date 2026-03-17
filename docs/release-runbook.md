# Release Runbook

Use this when cutting a new `kagi` release.

## Normal flow

1. Merge the approved work into `main`.
2. Bump the release version in:
   - `Cargo.toml`
   - `Cargo.lock`
   - `npm/package.json`
   - `CHANGELOG.md`
   - `docs/index.mdx` if the landing-page footer still shows the old version
3. Commit the release metadata update.
4. Push `main`.
5. Create and push the release tag, for example `v0.1.8`.

## What happens after the tag

- `.github/workflows/release.yml` runs on the tag.
- That workflow:
  - verifies the release build
  - builds and uploads cross-platform binaries
  - publishes or refreshes the GitHub release
  - syncs `Microck/homebrew-kagi` and `Microck/scoop-kagi`
- `.github/workflows/npm-publish.yml` runs after a successful `Release` workflow and publishes `npm/package.json` to npm.

## Recovery path

If a release needs to be rebuilt for an existing tag:

1. Run the `Release` workflow manually.
2. Pass `release_tag` with the existing tag, for example `v0.1.7`.

This rebuilds the artifacts and refreshes the GitHub release without minting a new version.

## Quick checks

- `gh release view vX.Y.Z`
- `gh run list --workflow Release --limit 5`
- `gh run list --workflow 'npm Publish' --limit 5`
- `npm view kagi-cli version`
