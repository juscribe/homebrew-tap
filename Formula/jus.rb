class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.6.35"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-arm64"
      sha256 "baef43c9c79188f21c31b96c1f83d2cb8c0f9eb02f71f8c5e23bf449ff07c5f6"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-amd64"
      sha256 "5bac7743a8ba0f76e6c3d1794566994a7c83008873475f03e5ceb28a922e28ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-arm64"
      sha256 "58fc08447c53ea89e27807347a15e282322cdb852d001c96c847b2600096968b"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-amd64"
      sha256 "389afab1fd983756d429e7431a69fbb70cb06ef786f60c90cd457413e4362e21"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-station/releases/download/v0.6.35/jus"
    sha256 "7661556b4472e773a8a4115498a13c381a144b27e7ac05a25c3ebd4b6efefc63"
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