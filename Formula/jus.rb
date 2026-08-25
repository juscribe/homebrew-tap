class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.6.26"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-arm64"
      sha256 "a9544bec428bc5066c2dab2bdcbe449e8f5e90c2ffb1aff9adce5aaf017b2256"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-amd64"
      sha256 "47284a54c511ee688b9f106e4ff8d97db42912a845bcb2fbdec1336a4e2adc2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-arm64"
      sha256 "3ec7adeb08b1f4a91e4da7ba0703c1858ad60b118928ecab28173338b49d2503"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-amd64"
      sha256 "4169dfe36ebcb3e7cecc7d60a75bda6598d05a294f19115851333e92cf25d0d5"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-station/releases/download/v0.6.26/jus"
    sha256 "77d42b291d88321f41270b71f541229d08d628c6a5cf2b4d8044ddd33472ffa2"
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jus-station-#{os}-#{arch}" => "jus-station"

    resource("jus-cli").stage do
      bin.install "jus"
    end
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jus 2>&1", 1)
    assert_match version.to_s, shell_output("#{bin}/jus-station version 2>&1")
  end
end