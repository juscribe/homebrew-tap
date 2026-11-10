class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  url "https://github.com/juscribe/jus/archive/refs/tags/v0.8.33.tar.gz"
  sha256 "449a7d5622228dfc15f0bd1af2b9acd9c8ec2784f9ebdff570ba38fde156c8d2"
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
