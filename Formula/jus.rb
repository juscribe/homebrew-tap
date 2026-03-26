class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.3.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-arm64"
      sha256 "ae553fc4a36be68ad79dc12b225577afce38673262f5b66d61cb7d1d7b82ba8b"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-amd64"
      sha256 "afd4f1d780f747917f4a5f2fb2e1947fbe734ee8510f8115d8b66bf28a38db5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-arm64"
      sha256 "1ab7ceb9b8fc6665e47e5ce934d5503f9d7ea36baef0626cbeabfc83bd9d61b7"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-amd64"
      sha256 "85c8096bd8909aff0123ef7dc5555261919c8d3c97dd97232721bb820f793fdf"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-agent/releases/download/v0.3.3/jus"
    sha256 "efbb957292c7ccda308a54fd82f79fab6d9a6089cc697cd1475906bb5b2133a3"
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