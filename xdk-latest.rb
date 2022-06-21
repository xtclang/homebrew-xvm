class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci44+716ff7b6d73f27a0668f508a6b33e2be7b8894fb.tar.gz"
  sha256 "7eabde42fbb6ef27b83acc86605d39213f68d0df842c1d013f37dbe077c3e3db"
  version "0.4.2.44"
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