class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2.tar.gz"
  sha256 "27ade6fc2aa62e30477276ff63bb846cd1ac63f547cb905055b9dc7e34adef37"
  version "0.4.2.tar.gz"
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