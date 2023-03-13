class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci361+a0a088bc9da815cca62ce43949c80b565a7f5553.tar.gz"
  version "0.4.3.361"
  sha256 "5736774b87afce33407b1ac7fe5fe5b3677639745d536743ae58686c8e3c8651"
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
