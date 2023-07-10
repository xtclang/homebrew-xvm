class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci608+d9bd6a7f2a2ce05c9017604f7673fc2dfbd079c3.tar.gz"
  version "0.4.3.608"
  sha256 "680559a3d3c2201770ecec8dd5b5d60b6a56832e129850ddcc71cbc944412781"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    osname = OS.linux? ? "linux" : "macos"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xtc"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xam"
  end

  test do
    assert shell_output("xec", 255).include? "Error: Module file required"
  end
end
