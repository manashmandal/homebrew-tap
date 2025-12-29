require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2025.1229.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.4/gale_2025.1229.4_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "f74eb3e32422e565dba7d36ac3c02bfcabedd0421987311c6f8a7acd42950ad1"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.4/gale_2025.1229.4_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "3278829932f0b107aecbbf91e0d5f2280433059bf98b863cee2dc9c18a8f5311"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.4/gale_2025.1229.4_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "4bde67e7c061c99f4721d3ac4504109b52e4e92ee6717532c433c97bfe8f9eb8"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.4/gale_2025.1229.4_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "d71c3ebb46b6f9c88922a283fc025bdace0e188bcf744160267168b50f9bd4e9"
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
