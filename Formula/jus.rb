class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.8.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-arm64"
      sha256 "4e504d436150331cefd6647466aa2b38d6263dde562e48623212b548fcdacfdf"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-amd64"
      sha256 "e2987fd8204d3a6f6d801bfda4461ee72d3640d4364157962927103e0b8b4e83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-arm64"
      sha256 "5549718c5b38fbc5a572239f2a8169d8f6e030e8d3593983d8afd92ba2cb8250"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-amd64"
      sha256 "4014019ed5a8fccf0c5300d45103f57941bd6776e33f3485c30085ac01b52b0e"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.5/jus"
    sha256 "adcbe5c1efdcc08a795f42742d2152b9aad0736e61d0143caadf4f7050988d20"
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jus-dispatch-#{os}-#{arch}" => "jus-dispatch"

    resource("jus-cli").stage do
      bin.install "jus"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jus 2>&1", 1)
    assert_match version.to_s, shell_output("#{bin}/jus-dispatch version 2>&1")
  end
end