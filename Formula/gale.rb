require_relative "../lib/private_strategy"

class Gale < Formula
  desc "Self-hosted GitHub Actions runner manager with auto-scaling"
  homepage "https://github.com/manashmandal/gale"
  version "2025.1229.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.3/gale_2025.1229.3_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "6a92ebf42a2c5d4cb8582de3d40ab790b60682df09739fcadd4758e217abea5c"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.3/gale_2025.1229.3_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "ab74a852e1422814f1c0951ae8f0132530767aaba5e1d601ddc68f4d4b2bbdc8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.3/gale_2025.1229.3_linux_amd64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "ef8c4232db79de1af06fa4305f9881c0c3ea78403d7c8001c5d04077d15557ea"
    end
    on_arm do
      url "https://github.com/manashmandal/gale/releases/download/v2025.1229.3/gale_2025.1229.3_linux_arm64.tar.gz", using: GitHubPrivateRepositoryDownloadStrategy
      sha256 "3d29faa21c92f8298bd63cce525807eced2755c595e5da9134487ed818b6c286"
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
