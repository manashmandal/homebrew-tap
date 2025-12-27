require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2025.1227.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.1/gale_2025.1227.1_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 ""
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.1/gale_2025.1227.1_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 ""
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.1/gale_2025.1227.1_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 ""
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.1/gale_2025.1227.1_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 ""
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
