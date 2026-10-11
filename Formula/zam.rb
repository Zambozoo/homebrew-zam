class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  url "https://github.com/Zambozoo/zam/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "da47a3c63ea325d790e5e421c011555dec95164e05e7f7c7fe151ab19e98c0bb"

  license "MIT" # Replace with your actual license

  # Go is required to build 'zam' from source
  depends_on "go" => :build

  def install
    # Explicitly point go build to ./cmd since main.go lives there
    system "go", "build", *std_go_args(output: bin/"zam"), "./cmd"
  end
  
  # Linux installations need an explicit C compiler dependency since zam invokes `cc`
  on_linux do
    depends_on "gcc"
  end

  def install
    # Uses standard Homebrew Go build flags to compile the binary into bin/
    system "go", "build", *std_go_args(output: bin/"zam")
  end

  test do
    # Verify the binary runs successfully
    assert_match "zam", shell_output("#{bin}/zam --version")
  end
end
