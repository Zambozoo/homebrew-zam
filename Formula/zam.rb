class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.12"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "0d80bc636d5a15d17b0259e9d5924f7ff6e9b6778a1ee6ae795b52207b36d5fd"
  when "darwin-arm64" then "903655a41e0bdbd8364d3bde3003786cf78a4578eef61ca5ed84c9f65afb72e1"
  when "linux-amd64"  then "1e0cda8d1f8baa0cb7305193acee134b4df0680f823fa956f5acee15df3a8f1b"
  when "linux-arm64"  then "7d9c9077b2c2445ff7e5d260ce5432bccde56ecefd23449bf0769f68f7a2b400"
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
