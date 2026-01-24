require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2026.0124.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0124.0/gale_2026.0124.0_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "3ff575d50b8eae21c52b4574d28d6447b1e69f531914cff9d28ddea656ef3695"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0124.0/gale_2026.0124.0_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "f24c41617346e59b122773d0d9df4cefb3a80eaa2237ec3d3a82b9de69c7cf24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0124.0/gale_2026.0124.0_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "55d99abc8258cf69fcbe9989b0cc56ec8de9d8306097ff0f37879f6cba28a3b8"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0124.0/gale_2026.0124.0_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "4b53452aab5e3fe1578ea63863300e17966fd1ec227a5d4b3bb4e600339af25e"
    end
  end

  def install
    bin.install "gale"
  end

  def caveats
    <<~EOS
      To get started:
        gale init     # Interactive setup
        gale start    # Start the autoscaler

      Note: This formula requires HOMEBREW_GITHUB_API_TOKEN to be set.
    EOS
  end

  test do
    system "#{bin}/gale", "version"
  end
end
