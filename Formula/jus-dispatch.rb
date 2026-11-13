class JusDispatch < Formula
  desc "Juscribe dispatch agent — runs your coding-agent CLI for the board"
  homepage "https://juscribe.ai"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.34/jus-dispatch-darwin-arm64"
      sha256 "de31eee1cf1f55ab40ab3bfa97b33c2e71e000796bc80195f43a1599f5ff6527"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.34/jus-dispatch-darwin-amd64"
      sha256 "f8fd848f9e23b2464c1f75f6cda2454d833433262156197eaea3bba84574d367"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.34/jus-dispatch-linux-arm64"
      sha256 "c782a77b94f444ec68377be28220c68e21f449bce3fcf3401e7e02432ce1bcaa"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.34/jus-dispatch-linux-amd64"
      sha256 "6ff41ad3d28a8cec88e108c18562f7245bc701eb44a0995551f20f978a04215d"
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
