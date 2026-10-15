class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  url "https://github.com/juscribe/jus/archive/refs/tags/v0.8.31.tar.gz"
  sha256 "965526b58410f163d49110b7817db824cc96def52670ab9e52e6e6f44bb487be"
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
