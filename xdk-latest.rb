class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci17+870b2247591f4231ea8bd988e4dc13c9516d1970.tar.gz"
  sha256 "5a8fbee12e9e33a67adf584f2f68a831644a061e02592ee7f63d7fd30f9c94fc"
  version "0.4.2.17"
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