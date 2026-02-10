class WgetUi < Formula
  desc "Modern web-based download manager powered by wget"
  homepage "https://github.com/manashmandal/wget-ui"
  url "https://github.com/manashmandal/wget-ui/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/manashmandal/wget-ui.git", branch: "main"

  depends_on "go" => :build
  depends_on "wget"

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"wget-ui", "."
    
    (var/"wget-ui").mkpath
  end

  def post_install
    (var/"wget-ui/data").mkpath
  end

  def caveats
    <<~EOS
      wget-ui has been installed!

      To start wget-ui:
        wget-ui

      Configuration via environment variables:
        WGET_UI_PORT=8080              # Server port (default: 8080)
        WGET_UI_PASSWORD=changeme      # Login password (default: changeme)
        WGET_UI_ALLOWED_PATHS=~/Downloads  # Allowed directories
        WGET_UI_MAX_CONCURRENT=3       # Max parallel downloads

      Example:
        WGET_UI_PASSWORD=secret wget-ui

      Then open http://localhost:8080 in your browser.
    EOS
  end

  service do
    run [opt_bin/"wget-ui"]
    working_dir var/"wget-ui"
    keep_alive true
    log_path var/"log/wget-ui.log"
    error_log_path var/"log/wget-ui.log"
    environment_variables WGET_UI_DATA_DIR: var/"wget-ui/data"
  end

  test do
    assert_match "wget-ui", shell_output("#{bin}/wget-ui --help 2>&1", 2)
  end
end
