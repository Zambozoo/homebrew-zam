class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.5"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"
  
  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "dd440453d4de8266c43d2bc73469c2457f329bcaf3912635c1ff7adfff0bb3dd"
  when "darwin-arm64" then "f20fc5fc80fb0750e0dcf917d389c8e97d2e29b0764d667c5dbe57fbc22f3081"
  when "linux-amd64"  then "85eb1eb0bbcff937722d79125470d2e85e5dc348458f60f0e4ae79b3cea24a41"
  when "linux-arm64"  then "6434bb27c24f6bcce6b9679c3ddb707a9a0766b094e3fcb77c28fa9c8f1a8984"
  end

  def install
    bin.install "zam"
  end

  test do
    assert_match "zam", shell_output("#{bin}/zam --version")
  end
end
