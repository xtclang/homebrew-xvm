class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci841+257c34367b5250348b96bfeae064fb8ad6966374.tar.gz"
  version "0.4.3.841"
  sha256 "53fddeec99a4a80be0426f5b29e37aaa74168a7ca99d4ed2fb80ff2460c54ee0"
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
