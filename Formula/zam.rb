class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  license "MIT"

  version "0.1.13"

  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Zambozoo/zam/releases/download/v#{version}/zam-v#{version}-#{os}-#{arch}.tar.gz"

  sha256 case "#{os}-#{arch}"
  when "darwin-amd64" then "5958e4aec4ea4017a4214bda0ae222ddb999e9ee1707a8460439ede60b8c9d17"
  when "darwin-arm64" then "777eb1adf74a75e518db18292a2ef591e973dc893b133453c726b18514991578"
  when "linux-amd64"  then "903a9676d9b4d6173d82bb729170ee1f72368bb48976d762cb1e9633028c65bb"
  when "linux-arm64"  then "2bd863f26ac55f0f8ac22ba6b2019cc7622d11748360489911766d86013d53bf"
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
