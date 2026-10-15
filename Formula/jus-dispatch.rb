class JusDispatch < Formula
  desc "Juscribe dispatch agent — runs your coding-agent CLI for the board"
  homepage "https://juscribe.ai"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.31/jus-dispatch-darwin-arm64"
      sha256 "48a04873524c55916b608c85b4e2852bdaee35d46ab01aede33610e94ea792f2"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.31/jus-dispatch-darwin-amd64"
      sha256 "de99f20b277b35ac180a8c309514a5b597753954009e6e3b960792ad12f2383e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.31/jus-dispatch-linux-arm64"
      sha256 "089a445bc2177b92e1bc3d4b9dbe68c76e17110171b06994e674ce10ea2e290c"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.31/jus-dispatch-linux-amd64"
      sha256 "7ad78ae7fda653e10ff0aefab65574aa971edc9fec7e5b5875c7f376f41d95a2"
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
