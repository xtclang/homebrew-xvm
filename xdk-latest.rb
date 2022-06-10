class Xdk-latest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.1ci1.tar.gz"
  sha256 "4e3f43a0149fdb725f1f6ffda2e5b9b33f59b1dcb9645024ea06fe8266b97856"
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