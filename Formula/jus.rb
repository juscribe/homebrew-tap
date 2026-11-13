class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  url "https://github.com/juscribe/jus/archive/refs/tags/v0.8.34.tar.gz"
  sha256 "f2261cd8e29f3607f0b1f621781cba4907ed46502eea834da105d2721f9e389d"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "jq"

  def install
    bin.install "jus"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jus 2>&1", 1)
  end
end
