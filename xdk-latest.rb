class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci829+e0ea1c9aad4612fa1148b9e753745f7434c5398c.tar.gz"
  version "0.4.3.829"
  sha256 "74670ce75ac81575aa66f9901f90acec5c2505fbfe5ca6b545218e1516df4603"
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
