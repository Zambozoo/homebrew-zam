class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.10"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "7551ee383c6bdba65bd1e5a0cf66ebf586fae33bb6c7daf6ae73ecb44be18c0d"
  when "darwin-arm64" then "7a64dea1ac4cbad6d661d4fd9eea73cd60228ae59ca652f89fe0ea82991dcf18"
  when "linux-amd64"  then "9c0deba56302ac473bb12a0dd3d4d6da6263485001cc8aea410ab47609c31a7d"
  when "linux-arm64"  then "4b02d5f4c3bdd53409dcc7d1ff2690eb661667178486208891a572b2633cea8d"
  end

  def install
    bin.install "zam"
  end

  def caveats
    <<~EOS
      With zig on the path, zam compiles its runtime for each target, and a
      project's native.files need it:
        brew install zig
    EOS
  end

  test do
    assert_match "zam", shell_output("#{bin}/zam --version")
  end
end
