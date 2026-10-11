class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  url "https://github.com/Zambozoo/zam/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "c16f06c164c4bef958a41867618f5e07dae7e87fa241b3b8e08a6c6caa237cb0"

  license "MIT" # Replace with your actual license

  # Go is required to build 'zam' from source
  depends_on "go" => :build

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
