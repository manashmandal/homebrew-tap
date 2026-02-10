# Homebrew Tap

Personal Homebrew tap for my tools.

## Installation

```bash
brew tap manashmandal/tap
```

## Available Formulae

| Formula | Description | Repo |
|---------|-------------|------|
| claude-profile | CLI tool to switch Claude Code authentication profiles | Public |
| gale | Self-hosted GitHub Actions runner manager with auto-scaling | Private |
| imggen | CLI tool for generating images using AI image generation APIs | Public |
| wget-ui | Modern web-based download manager powered by wget | Private |

## Public Formulae

```bash
brew install manashmandal/tap/imggen
brew install manashmandal/tap/claude-profile
```

## Private Formulae (gale, wget-ui)

Private repo formulae require `HOMEBREW_GITHUB_API_TOKEN` to be set.

### Step 1: Create a GitHub Fine-Grained Personal Access Token

1. Go to https://github.com/settings/personal-access-tokens/new
2. Set a name and expiration
3. Under **Repository access**, select **Only select repositories** and pick the private repos (e.g. `wget-ui`, `gale`)
4. Under **Permissions > Repository permissions**, set **Contents: Read-only**
5. Generate and copy the token

### Step 2: Set the Token

```bash
# bash/zsh — add to ~/.bashrc or ~/.zshrc
export HOMEBREW_GITHUB_API_TOKEN="github_pat_your_token_here"

# fish — persists automatically
set -Ux HOMEBREW_GITHUB_API_TOKEN "github_pat_your_token_here"
```

### Step 3: Install / Upgrade

```bash
brew install manashmandal/tap/gale
brew install manashmandal/tap/wget-ui
brew upgrade manashmandal/tap/wget-ui
```

## Private Repo Download Strategies

This tap provides two custom download strategies in `lib/private_strategy.rb`. Both require `HOMEBREW_GITHUB_API_TOKEN`.

### `GitHubPrivateRepositoryDownloadStrategy`

For formulae that download **pre-built release assets** (e.g. `gale`).

- Formula URL format: `https://github.com/{owner}/{repo}/releases/download/{tag}/{filename}`
- Overrides `_fetch` to resolve the asset ID via GitHub API and download with auth
- Used by: `gale`

### `GitHubPrivateRepositoryArchiveDownloadStrategy`

For formulae that **build from source** using source tarballs (e.g. `wget-ui`).

- Formula URL format: `https://api.github.com/repos/{owner}/{repo}/tarball/{tag}`
- Injects `Authorization` and `Accept` headers via `meta[:headers]` so all curl calls (HEAD + GET) are authenticated
- Used by: `wget-ui`

### Troubleshooting

**Q: `curl: (22) The requested URL returned error: 404`**

Possible causes:
1. **Token not set** — GitHub returns 404 (not 403) for unauthenticated requests to private repos. Verify: `echo $HOMEBREW_GITHUB_API_TOKEN`
2. **Token lacks access** — Fine-grained PATs must have the specific repo selected AND **Contents: Read-only** permission. Test with: `curl -sI -H "Authorization: token $HOMEBREW_GITHUB_API_TOKEN" "https://api.github.com/repos/manashmandal/<repo>"` — should return 200, not 404
3. **Tag doesn't exist** — Verify the tag exists: `gh release list --repo manashmandal/<repo>`

**Q: `curl: (22) The requested URL returned error: 401`**

The token is being sent but rejected. The token may be expired or revoked. Regenerate it.

**Q: Why not use `github.com/.../archive/refs/tags/` URLs for source tarballs?**

GitHub's `/archive/` web endpoint does NOT work with fine-grained PATs — it returns 404 even with a valid token that has API access. The GitHub API tarball endpoint (`api.github.com/repos/.../tarball/`) works correctly. This is why `wget-ui` uses the API URL.

**Q: Why does `gale` use a different strategy than `wget-ui`?**

`gale` distributes pre-built binaries as GitHub Release assets. The `GitHubPrivateRepositoryDownloadStrategy` resolves the asset ID via the Releases API and downloads via the asset endpoint. `wget-ui` builds from source, so it needs the source tarball via the API tarball endpoint.

**Q: sha256 mismatch after changing URL from `/archive/` to API tarball?**

GitHub generates slightly different tarballs from the two endpoints. Recompute: `curl -sL -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/manashmandal/<repo>/tarball/<tag>" | shasum -a 256`

**Q: Tap didn't update after pushing changes?**

Homebrew's `brew update` can silently fail to pull tap changes. Force it:
```bash
cd $(brew --repository)/Library/Taps/manashmandal/homebrew-tap && git pull origin main
# or
brew tap --force manashmandal/tap
```
