class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci15+88cc80e069e19afe75498054c726664878fca843.tar.gz"
  sha256 "ddb96c47e7372c6bdf2818774c2b2013ae05a1cb286ecc8af5bf0fe88a9d6ec8"
  version "0.4.2.15"
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
    assert_match "Error: Module file required", shell_output("xec")
    // assert_match "Error: Module file required", shell_output("#{bin}/xec")
  end
end