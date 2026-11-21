class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.8"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "5b5c01a83c7953a7a957573049d0b7bfdf43509fa3371326c1492a70d235832a"
  when "darwin-arm64" then "f3dc409106313bdb84691834b5ba5808b8be619b55988f4a4d57297e1f0e8279"
  when "linux-amd64"  then "80952b568078ccd57280c7e03e4154d12bfb56fd925c9378bdcf8b354c280a5e"
  when "linux-arm64"  then "aef0909303c83cdb89a478dc6d03eb926ef9cab0a04dc0f5216cf946d1a163ee"
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
