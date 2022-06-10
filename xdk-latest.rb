class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci14+5922b1c54c0970eb89fed13e125d0c1d4713fb08.tar.gz"
  sha256 "7f964934b66a5b3cc8d0f44b5f1332fdfed1a38b070e4249af8e0c672ae42ffc"
  version "0.4.2.14"
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