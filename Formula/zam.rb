class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.14"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "015718f773b0c12b4d284d920e779727bad543a001c8ebe6621e3db8ffc83c0d"
  when "darwin-arm64" then "01d406154b4ca19f4078d18ecb2add2439aa7fa8d2d5284de74cb298a539db28"
  when "linux-amd64"  then "223e9128980680bc9635181f2b771b55a42ff988279174e5f71d9bb5dce56453"
  when "linux-arm64"  then "b35169841032c7a4715f74e35f82da968eb309fd14c52c9bf978d5e3d3c686e1"
  end

  def install
    bin.install "zam"
    pkgshare.install "std"
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
