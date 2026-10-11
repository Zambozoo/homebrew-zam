class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  url "https://github.com/Zambozoo/zam/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "da47a3c63ea325d790e5e421c011555dec95164e05e7f7c7fe151ab19e98c0bb"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Zambozoo/zam/releases/download/v0.1.4/zam-v0.1.4-darwin-amd64.tar.gz"
      sha256 "fc1f5833a93208d69be917dd063aaeeaeb01aa27d1573786f33e47f213b444c3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Zambozoo/zam/releases/download/v0.1.4/zam-v0.1.4-darwin-arm64.tar.gz"
      sha256 "f8e4b73faad30795fcdcb68ff22e8abf28152f0e70ac8c8996e9daefb92583ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Zambozoo/zam/releases/download/v0.1.4/zam-v0.1.4-linux-amd64.tar.gz"
      sha256 "d1aee2ee7a176b60ed8a57d80b40957fcd2d82f820dd6ca1720db1c7f89af5ff"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Zambozoo/zam/releases/download/v0.1.4/zam-v0.1.4-linux-arm64.tar.gz"
      sha256 "07f28641d49b106823da767c73b2897b04fbb286beb2900be148c30421e025f0"
    end
  end

  def install
    bin.install "zam"
  end

  test do
    assert_match "zam", shell_output("#{bin}/zam --version")
  end
end
