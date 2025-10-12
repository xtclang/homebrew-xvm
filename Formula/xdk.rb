class Xdk < Formula
  desc "Ecstasy language XDK (XTC Development Kit)"
  homepage "https://xtclang.org"
  url "https://github.com/xtclang/xvm/releases/download/xdk-latest-snapshot/xdk-0.4.4-SNAPSHOT.zip"
  sha256 "1894e4ec2ec06b2e3ac38a7a1d6bac0d17a0a0dfdf77d58c57d9adcae494e795"
  version "0.4.4-SNAPSHOT"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/xec"
    bin.install_symlink libexec/"bin/xcc"
    bin.install_symlink libexec/"bin/xtc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xec --version")
  end
end
