class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci51+8915ec5ea55bb8d957468a8431857000cdceeadf.tar.gz"
  version "0.4.3.51"
  sha256 "233fdf6867a7f31e8acb941b2e287405ec07e6028bc3a7857d14fbead9564514"
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
