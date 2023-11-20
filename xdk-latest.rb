class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci834+a6fe25cf8c36e753d14793df1942a8db12601c33.tar.gz"
  version "0.4.3.834"
  sha256 "7f0763701e67da8aa287257146933da909a8bc44694e74966ab2335c430778b7"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    osname = OS.linux? ? "linux" : "macos"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xtc"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xcc"
  end

  test do
    assert shell_output("xec", 255).include? "Error: Module file required"
  end
end
