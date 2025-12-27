require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2025.12.27"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/2025.12.27/gale_2025.12.27_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "b84bc8f5957f0ca2ae6a104b8a42e2859fb145029deb755d177cfd79c6ec1977"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/2025.12.27/gale_2025.12.27_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "acf13f3923e09c2b713d38221a74dd77a1d045729f200b949f336a040095768c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/2025.12.27/gale_2025.12.27_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "0382de6a664ff5aab4aa6d9a7a18c1e380c765015d92dcab3cef33106ebd6a0a"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/2025.12.27/gale_2025.12.27_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "0a44c5e4f80c171c88f7319f194330d93bb069213119eb807d381866c9ef50c9"
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
