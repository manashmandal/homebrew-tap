# typed: false
# frozen_string_literal: true

class ClaudeProfile < Formula
  desc "CLI tool to switch Claude Code authentication profiles"
  homepage "https://github.com/manashmandal/claude-code-profile-switcher"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/v0.0.2/claude-profile_0.0.2_darwin_amd64.tar.gz"
      sha256 "773fa69fc5c421d75d949143990dc4cbe19c2dfe83a4f4598202ff672b4701e7"

      def install
        bin.install "claude-profile"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/v0.0.2/claude-profile_0.0.2_darwin_arm64.tar.gz"
      sha256 "b51c303ce88de226a3bad658ecd4980940e6d054117e62772c1ec49a5fa369b4"

      def install
        bin.install "claude-profile"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/v0.0.2/claude-profile_0.0.2_linux_amd64.tar.gz"
      sha256 "e4ee73128f4944005617f3a3c1fb75fd05dc7c7185b20ac6e1499929cc1e7829"

      def install
        bin.install "claude-profile"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/v0.0.2/claude-profile_0.0.2_linux_arm64.tar.gz"
      sha256 "02b53e6e7bcd73abbd6bc7fded0960f7716b940ab88588c54adc7079c902f8a5"

      def install
        bin.install "claude-profile"
      end
    end
  end

  test do
    system "#{bin}/claude-profile", "--version"
  end
end
