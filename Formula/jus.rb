class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.8.12"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-arm64"
      sha256 "00fdf42b26bef5b2d0e12a6d1a97bb4a7ea59ac17178db05938f6604d7883241"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-amd64"
      sha256 "449765413968adcb1e19386ca361e00da74ce408fae2651d785763bd8f629d1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-arm64"
      sha256 "1bc77ad0ff6f612405c841ebe2444279e7206ceb07c35f6dd15fa2eeb9176786"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-amd64"
      sha256 "1cf7b244a25ded3e5a2a05b7c84c82837ece1cf21252b4338fb8219aadfebe7a"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.12/jus"
    sha256 "d396c2556c3474e1eee7678d3bc05503edae4f13550f44a576b3b80dec7dbfca"
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