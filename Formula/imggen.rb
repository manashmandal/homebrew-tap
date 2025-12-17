class Imggen < Formula
  desc "CLI tool for generating images using AI image generation APIs"
  homepage "https://github.com/manashmandal/imggen"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manashmandal/imggen/releases/download/v0.0.2/imggen-darwin-amd64"
      sha256 "6698668c385865606b719a8638a5f2e4a9bf860a23afc8ae1432e2a0a63dc87e"
    end
    on_arm do
      url "https://github.com/manashmandal/imggen/releases/download/v0.0.2/imggen-darwin-arm64"
      sha256 "7e5107b7d226b585393a7495d91ae000406e294ae36fade162bb3c9f85b115a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/manashmandal/imggen/releases/download/v0.0.2/imggen-linux-amd64"
      sha256 "dfb96bd52cc883ce08a762f9347781bfbba265f8c51a13da58197b89b439e6fa"
    end
    on_arm do
      url "https://github.com/manashmandal/imggen/releases/download/v0.0.2/imggen-linux-arm64"
      sha256 "66c92e4ccea9e2de261a20b00baaca29f06cdc405e30f60888926809a0788395"
    end
  end

  def install
    binary_name = "imggen"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "imggen-darwin-arm64" : "imggen-darwin-amd64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "imggen-linux-arm64" : "imggen-linux-amd64"
    end
    bin.install Dir["*"].first => "imggen"
  end

  test do
    assert_match "imggen", shell_output("#{bin}/imggen --help")
  end
end
