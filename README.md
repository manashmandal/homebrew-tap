# Homebrew Tap

Personal Homebrew tap for my tools.

## Installation

```bash
brew tap manashmandal/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| gale    | Self-hosted GitHub Actions runner manager with auto-scaling |
| imggen  | CLI tool for generating images using AI image generation APIs |

## Usage

### imggen (Public)

```bash
brew install manashmandal/tap/imggen
```

### gale (Private Repository)

`gale` is hosted in a private repository. To install, you need a GitHub Personal Access Token with `repo` scope.

#### Step 1: Create a GitHub Token

1. Go to https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Select the `repo` scope
4. Copy the generated token

#### Step 2: Set the Token and Install

```bash
# Set the token (add to ~/.bashrc or ~/.zshrc for persistence)
export HOMEBREW_GITHUB_API_TOKEN="ghp_your_token_here"

# Tap and install
brew tap manashmandal/tap
brew install manashmandal/tap/gale
```

#### Step 3: Verify Installation

```bash
gale version
```

### Why is a Token Required?

GitHub does not allow downloading release assets from private repositories via direct URLs. This tap uses a custom download strategy that authenticates via the GitHub API to fetch release assets.

See [this blog post](https://dev.to/jhot/homebrew-and-private-github-repositories-1dfh) for more details on the workaround.

## Updating

```bash
brew update
brew upgrade gale
```

**Note:** Ensure `HOMEBREW_GITHUB_API_TOKEN` is set when upgrading `gale`.
