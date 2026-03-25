class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-arm64"
      sha256 "9296f1ba75d883b1cb2eff363563946c19738ae2b7ae3b9017af654935ef0b89"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-amd64"
      sha256 "73cb24c49c530f65eb2671d80a3e69a78ed1b8c3a1caf5f8f1a2206bdce19532"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-arm64"
      sha256 "bc9c8b4fd9ae0fad852b4abf6ddeb02cd1be725a96d2eaeb8d45f9b48641861b"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-amd64"
      sha256 "f42e47764a1ce0401de76311eff0d2154029cfd082fdbd999400cb8372d5e3ab"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-agent/releases/download/v0.2.0/jus"
    sha256 "23138839a143df2194dc1270c39df26d92f5f4a1c5591228ed1a59fb3c44fc8d"
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