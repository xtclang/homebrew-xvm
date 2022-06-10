class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci15+88cc80e069e19afe75498054c726664878fca843.tar.gz"
  sha256 "ddb96c47e7372c6bdf2818774c2b2013ae05a1cb286ecc8af5bf0fe88a9d6ec8"
  version "0.4.2.15"
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