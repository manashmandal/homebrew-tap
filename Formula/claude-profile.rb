# typed: false
# frozen_string_literal: true

class ClaudeProfile < Formula
  desc "CLI tool to switch Claude Code authentication profiles"
  homepage "https://github.com/manashmandal/claude-code-profile-switcher"
  version "v0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/vv0.0.1/claude-profile_v0.0.1_darwin_amd64.tar.gz"
      sha256 "6e22ee7d0bb0c330fc397b379fd97a2fc765a89a22325e72bc0253dfd33496f8"

      def install
        bin.install "claude-profile"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/vv0.0.1/claude-profile_v0.0.1_darwin_arm64.tar.gz"
      sha256 "7a35d65d8cf087bd103f2050d5a05156ff8633734523067b76e70448bd4f581e"

      def install
        bin.install "claude-profile"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/vv0.0.1/claude-profile_v0.0.1_linux_amd64.tar.gz"
      sha256 "78bba63f5cf3ccfb65660c503d95a3ffc10c9d886a35f87e54af3cb5774f8625"

      def install
        bin.install "claude-profile"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/manashmandal/claude-code-profile-switcher/releases/download/vv0.0.1/claude-profile_v0.0.1_linux_arm64.tar.gz"
      sha256 "8db84c3c6a1afb69df87cc5d6e392002de2115598b3fb1cb2b50de30f9444a87"

      def install
        bin.install "claude-profile"
      end
    end
  end

  test do
    system "#{bin}/claude-profile", "--version"
  end
end
