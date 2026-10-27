class JusDispatch < Formula
  desc "Juscribe dispatch agent — runs your coding-agent CLI for the board"
  homepage "https://juscribe.ai"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.32/jus-dispatch-darwin-arm64"
      sha256 "a34a577fb1d0cadf1b0b1df5e357608dbe9cffaef048d8e4d793f2d2feae83d0"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.32/jus-dispatch-darwin-amd64"
      sha256 "aeef8d869b19238017870c6668592165bc97b435ca4e4653a7cc59b81699971f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.32/jus-dispatch-linux-arm64"
      sha256 "0591416015fe9e8de3092f7f9309d3dd32752c0d8c3cbb7ce823175b43d7666a"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.32/jus-dispatch-linux-amd64"
      sha256 "a80dfb531d378b58854b041a5288dc0d50d79ea8db2c0d88b7e32f310de66b42"
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
