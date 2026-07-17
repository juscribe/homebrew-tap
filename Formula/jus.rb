class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.6.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-arm64"
      sha256 "b2e414c499f7b313fa0d69559ca36206421061e0c5f7f8be1fb0cc110fc439b6"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-amd64"
      sha256 "c499d26966f3534f4f7ed56f9a1ab68594b159e620a2406f369936e050fdc28e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-arm64"
      sha256 "6f6d43dffb286f6f0c42be7ac1fe6e059b17430bf4a9a13a866f1b8802fa2c83"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-amd64"
      sha256 "39dea6fd9831fb3fae1d4ce3f37060705eae584379c9582dc0231dfde1292cf8"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-station/releases/download/v0.6.4/jus"
    sha256 "2c6e449b197d06f4e109c3d605b95cecf287b357d59b221a895b3c0d6a8d92d9"
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