require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2026.0106.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0106.0/gale_2026.0106.0_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "17f0d52432d8273033ccb0204a75ed5c97609418d910b5ff3936efc0396f6b85"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0106.0/gale_2026.0106.0_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "c0357a37523aa4881b71a2e9048d6a8be71a1769410d126f36aa4f504562fb70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0106.0/gale_2026.0106.0_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "8a34ab2b885e2f3835bbb96457343029f05115e00df7928a145730bccded3a06"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2026.0106.0/gale_2026.0106.0_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "a93ab9581e64204219822ebb8c6302f6ef3b7d23a1a5c376a867d6c045c71805"
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
