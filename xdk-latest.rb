class Xdk-latest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/"
  sha256 ""
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