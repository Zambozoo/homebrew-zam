class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.9"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "8ff7a8480555cbef315e419de44042e1fc38746c30fcb51612805cf782fd1e94"
  when "darwin-arm64" then "7fa9436171fa074db3d392c157c14bc7bfb0dbed0dcc0c7dbbe43429d57f1ffb"
  when "linux-amd64"  then "0c964eaf4b8d5ff506a0d3bbb6c76b590462357952816d2dbc9a9ebc7427a525"
  when "linux-arm64"  then "3dddf4d676cdf13a7107850c8cede0462b5879d60f87ea24b53154adb767827b"
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
