class Jus < Formula
  desc "Juscribe CLI — project management for AI-native teams"
  homepage "https://juscribe.ai"
  version "0.6.34"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-arm64"
      sha256 "14061cb7791f4bcb887f357748d798421b6c4929e65fe8bab9c67b69963b7cad"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-darwin-amd64"
      sha256 "0959936290e4a12373b528d845e61a7dbea74bdc1f5f1e2659c254d213244515"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-arm64"
      sha256 "b8f9a9173494f401da263d2fbf682c1d4d8c417d573ae33c695f5d37e28e62fb"
    else
      url "https://github.com/juscribe/jus-station/releases/download/v#{version}/jus-station-linux-amd64"
      sha256 "f12d665db15af39379f09b4f08816743f508c63b80b69f3e593fe1cb04116407"
    end
  end

  resource "jus-cli" do
    url "https://github.com/juscribe/jus-station/releases/download/v0.6.34/jus"
    sha256 "3688742f5574e04c7e6b751240ccc2605da5c9a79fadb9cbe841664aa09f40fa"
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