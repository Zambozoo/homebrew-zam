class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.7"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "7e8a435a1df5e69b8cafc647d7cc1932fb47931f18de7f6b0d1a5855a29c7f0d"
  when "darwin-arm64" then "8e79467b29f50cc8a5e4e80a184a1d06c34d0aab5b65f529bfd19be4e17e1be2"
  when "linux-amd64"  then "b670fa2d66dddf92d2d934ea2dc1a0f8fd982046188287b4217a628d032113a6"
  when "linux-arm64"  then "e7ab7eb0fb2bc3120f43c8eff03919e76a81ff56bf29351e44e547bd9307de11"
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
