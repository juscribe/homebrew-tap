class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  url "https://github.com/juscribe/jus/archive/refs/tags/v0.8.30.tar.gz"
  sha256 "adc714a0ff4d0d0ea66ab7075007de0933a7ee70d354163b2d60df1f61fba020"
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
