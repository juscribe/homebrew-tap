class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.8.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-arm64"
      sha256 "48aa7d8a93ae961e901d4f2e4d92319fc3eeae03f2e5abe3e4eb9bab99eaea2c"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-amd64"
      sha256 "aca5261d2f0b7ee78f02727260ef8ad3aa600506848699aee53f494fa20440bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-arm64"
      sha256 "29f35e176658a3718c0ce772d9c045cf7141ee5b933dc2876c5ff58bdfca370a"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-amd64"
      sha256 "709222cb422919df9a146b89b662c1f592aa19a9a8d548bb561977cc27e53e98"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.2/jus"
    sha256 "23ceb4d35798ae30bfc7a7fd18e313368bc634368456d31e00c0da9528cc3c95"
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