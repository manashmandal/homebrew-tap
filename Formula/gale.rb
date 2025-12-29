require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2025.1229.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.5/gale_2025.1229.5_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "a18cfb736d64d12da79dc88dc991476186355d9c7a8bfaa937af14536ac37888"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.5/gale_2025.1229.5_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "7db93cfeea07287d76513a8b64cff0aba9dc19e4baf557847ad9c47d6e2e126d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.5/gale_2025.1229.5_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "078881a85082580024b4c804d74b8efc2d774ebdd76a02849a4147c91734781a"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.5/gale_2025.1229.5_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "6e9c05b4c684e2a3e07e857deceab10b50f6ac3baa9399a991a96bf527076846"
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
