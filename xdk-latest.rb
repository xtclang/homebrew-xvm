class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci43+5b366af8bba937a70ac85e7df134991f249e0333.tar.gz"
  sha256 "85febfd654285310f616ce163f21b1afd257d7910d9c6b6247af267439223514"
  version "0.4.2.43"
  license "Apache-2.0"

  depends_on "openjdk"

  on_linux do
    OSNAME = "linux"
  end

  on_macos do
    OSNAME = "macos"
  end

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    bin.install_symlink "#{libexec}/bin/#{OSNAME}_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/#{OSNAME}_launcher" => "xtc"
    bin.install_symlink "#{libexec}/bin/#{OSNAME}_launcher" => "xam"
  end

  test do
    assert_equal "Error: Module file required", shell_output("xec")
  end
end