class JusDispatch < Formula
  desc "Juscribe dispatch agent — runs your coding-agent CLI for the board"
  homepage "https://juscribe.ai"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.33/jus-dispatch-darwin-arm64"
      sha256 "ee5c9e75606cf89433ec2cb77868a322e704591c085d57b81dd1b6f6230ca974"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.33/jus-dispatch-darwin-amd64"
      sha256 "5bfa0b97b03955ece1963082e9e54a72851853e305e55b2313240fc8fd6b35a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.33/jus-dispatch-linux-arm64"
      sha256 "7aef2b3e40c8302d6d5454daf9e184c932970857d894acdca4cbe2e9baad7226"
    end
    on_intel do
      url "https://github.com/juscribe/jus-dispatch/releases/download/v0.8.33/jus-dispatch-linux-amd64"
      sha256 "e3584f9cb29bfaeb4888e6a040ab648537b92944058c6ef6bac8981479fb7472"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "jus-dispatch-#{os}-#{arch}" => "jus-dispatch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jus-dispatch version 2>&1")
  end
end
