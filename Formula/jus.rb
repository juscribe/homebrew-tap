class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-amd64"
      sha256 "PLACEHOLDER"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-agent/releases/download/v#{stable.version}/jus"
    sha256 "PLACEHOLDER"
  end

  def install
    # Determine the downloaded binary name
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jus-agent-#{os}-#{arch}" => "jus-agent"

    resource("jus-cli").stage do
      bin.install "jus"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jus 2>&1", 1)
    assert_match version.to_s, shell_output("#{bin}/jus-agent --version 2>&1")
  end
end

