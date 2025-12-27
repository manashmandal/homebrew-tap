require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2025.1227.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.0/gale_2025.1227.0_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "ebad7d9be1c4a283a17f1ef0bb5924fb446a449a926c371bd89e998ee69b5bb1"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.0/gale_2025.1227.0_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "1c396bc9e7e08b8da85a18ff5fa144f6785057d7758b53c9c9b2c6deba90d055"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.0/gale_2025.1227.0_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "c47a47ee8a988953058f61fc4a779962ff770013c2402560702e295d80d818fc"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1227.0/gale_2025.1227.0_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "8bb0eca5cc751f023e31db360da3d31d01c6696f36447d94fd384ea47e9375f7"
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
