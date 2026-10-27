class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  url "https://github.com/juscribe/jus/archive/refs/tags/v0.8.32.tar.gz"
  sha256 "355a503d7268f8e950b046447cf822ad8f7600c19036f804ffa5c99df4be17ee"
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
