class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci12+fa368903df964188b46cf8d66c9ba639349f8745.tar.gz"
  sha256 "898d08724ff0a1bff7780c5c8003b49f9eb9ad046a4cefd1cb484a21927cb8ce"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    bin.install_symlink "#{libexec}/bin/macos_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/macos_launcher" => "xtc"
    bin.install_symlink "#{libexec}/bin/macos_launcher" => "xam"
  end

  test do
    system "#{bin}/xec"
  end
end