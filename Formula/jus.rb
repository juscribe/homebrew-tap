class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.3.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-arm64"
      sha256 "6ed494cd8a24232a8320860649e207384bf3cc7adb66b6ece3ce3ff549a3bd6c"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-amd64"
      sha256 "eaf9128854759b66f96c4beb37a3ea1be35e1d3805f7f895c363168328396027"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-arm64"
      sha256 "14699d24a2728161e781084cb1e638a295be00a2b8f142974896f8fdb508f99e"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-amd64"
      sha256 "810745b92a2ba2a6b117795af4ced70d802c8fc5b4c084a9bca1f99ab834443e"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-agent/releases/download/v0.3.4/jus"
    sha256 "9c71e4c82e4b74bf8bf2010c806d07340922a6b6493268744d765c597e676f2f"
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jus-agent-#{os}-#{arch}" => "jus-agent"

    resource("jus-cli").stage do
      bin.install "jus"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jus 2>&1", 1)
    assert_match version.to_s, shell_output("#{bin}/jus-agent version 2>&1")
  end
end