class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.8.13"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-arm64"
      sha256 "17867e4f8deb1a86b827b2e8dbd1aa927c2a9382e4ed706efcc1a45f0a65fd91"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-darwin-amd64"
      sha256 "b700f7ebd92fe86d4a9408ef5602708cbbafebbdf64626f23c4a7b5d6ed9cb6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-arm64"
      sha256 "a7a4c3e0f495f4f33c9d9f545e4423b1ed23f940a0113fb08d21474b0bf6d0f9"
    else
      url "https://github.com/juscribe/jus-dispatch/releases/download/v#{version}/jus-dispatch-linux-amd64"
      sha256 "91ba1f3b501a8db2a795c2a2ac87bc49965e4ccd637964218812f4cc3f55c310"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.13/jus"
    sha256 "605135c36330803f32e428e2f1ae33735366a32ebf41e566388deb704bdb7512"
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