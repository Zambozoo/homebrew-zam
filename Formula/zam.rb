class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.11"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "3a9352955be18fbdeaef9e8cdd9d19dc5d66601c29ab7b294da07b3761f3574f"
  when "darwin-arm64" then "4d540bf72800928e44bd04954e710d3f2543ad357e1557f42831719836e77462"
  when "linux-amd64"  then "4b8f1d3ced55534386d217602a69dce87799f1cf7d106d95cdfc461a73493479"
  when "linux-arm64"  then "a81ddab9ff0ac8392709c1acfbde1b1dc412ea264c4ba95206df6918de28df46"
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
