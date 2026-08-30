class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.6.28"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-arm64"
      sha256 "f43df985a470b38641c2cfd0c3b3a185d13717d5871f3daaa812592065fcd2ee"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-amd64"
      sha256 "7398885eb5828cfe87c5243ddb73d3df558145dd7c450262c9ea5114bbe46d5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-arm64"
      sha256 "0ffe8edef6b4ecc0aea0538aed62441db8625853b7dd4018425830e412482ebb"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-amd64"
      sha256 "fffddd3addcd23a34ca48a30766044af3e53cb13aef31f43ea1fe5f16fdad7ec"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-station/releases/download/v0.6.28/jus"
    sha256 "d484325ef7aa4db50eed4dedd7c1ba266fb982fbe441358f9c0df13a3ffb4045"
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