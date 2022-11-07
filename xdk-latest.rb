class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci123+ed00385d1f089526e3638fd0ea0b4dee82865534.tar.gz"
  version "0.4.3.123"
  sha256 "82f25177792dd0b72be95b6f97e42944d61acb5095234742783eae91bbf43648"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    osname = OS.linux? ? "linux" : "macos"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xtc"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xam"
  end

  test do
    assert shell_output("xec", 255).include? "Error: Module file required"
  end
end
