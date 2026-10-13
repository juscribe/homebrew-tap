class JusDispatch < Formula
  desc "Juscribe dispatch agent — runs your coding-agent CLI for the board"
  homepage "https://juscribe.ai"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.30/jus-dispatch-darwin-arm64"
      sha256 "09a57bf7867556e540aac80704e6d53f50d8357e787963ba01221f8cadbda936"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.30/jus-dispatch-darwin-amd64"
      sha256 "fd6cb68796372936bca49c434006324a6af4dc209c7fe99f74dcff99d3147fcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.30/jus-dispatch-linux-arm64"
      sha256 "584e7ba57d35bc0aa0a37b6e292751ae08a215000071bd5c97a85f5eefb5bb38"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.30/jus-dispatch-linux-amd64"
      sha256 "23bb3e99942dbe4958228ae19a5f43820e74b187093213313ec737c391df8a87"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jus-dispatch-#{os}-#{arch}" => "jus-dispatch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jus-dispatch version 2>&1")
  end
end
