class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.3.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-arm64"
      sha256 "1f109421ffc8d9efbaa7496552549b8ac6a7fad29582ffd07dd0c3b247f972b0"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-darwin-amd64"
      sha256 "525d89b5c160d0617fb4b258eb67cc508589d953afb79aa13f067008e65b27bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-arm64"
      sha256 "2280fda34e4644f973c7a2fece56b6e10eccc172aae05b509d0c7845634fb26e"
    else
      url "https://github.com/juscribe/jus-agent/releases/download/v#{version}/jus-agent-linux-amd64"
      sha256 "a6a1fee1c439dfddee5012794bf1592cfae125e7362d1e829c5bb46b152645d5"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-agent/releases/download/v0.3.2/jus"
    sha256 "3c852be60de64d9530c02dde89e9bb0bbfa3013dec3b028f7b0de8a74828fcef"
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