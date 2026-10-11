class Zam < Formula
  desc "The Zam programming language"
  homepage "https://github.com/Zambozoo/zam"
  url "https://github.com/Zambozoo/zam/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"

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
