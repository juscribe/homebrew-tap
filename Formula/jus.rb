class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.8.18"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-arm64"
      sha256 "6ab641eb1df38ce2afdd7d839ffec444e545c586cdb8efd0f8ce022c703a8cc1"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-amd64"
      sha256 "d529838ece758b6723a75eb0530a3f19ee32d938fa09d7921d75bcd036639cc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-arm64"
      sha256 "38d83161884de44e5b2ae1266d24e638b660d2d7436a6774e42d6e3165071249"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-amd64"
      sha256 "ba70511bd11adb62f7f9924f31c1df660bc2ff273e4beb74427178dd4cfcc45d"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.18/jus"
    sha256 "32b7c47b02dbeb4077ae36f4b428b74bb2c396294b31b50785fd70a21dcb3fd0"
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