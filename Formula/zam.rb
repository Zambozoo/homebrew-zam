class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.4"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"
  
  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "9af6d46ee7f4a992385898f9649c6f795873e4480a161fa2dac10cda79eff227"
  when "darwin-arm64" then "690ce3790dce823b217717a774809dcedf08b34ae706d587c4e87155faf3851f"
  when "linux-amd64"  then "853dc5ac7837172a8d53430091432adb5eed5ec56d3fe60e366f15a313ea936a"
  when "linux-arm64"  then "493d00bf2f54fc2243a8ac9923e8d9d2bc1bc017aa3fac7052a58e3e333577a9"
  end

  def install
    bin.install "zam"
  end

  test do
    assert_match "zam", shell_output("#{bin}/zam --version")
  end
end
