class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci884+c425fac96d86d6a8ca0b7fe64de7fe07a5712cf1.tar.gz"
  version "0.4.3.884"
  sha256 "489150d7dd6d053b5044df09964b26c1e024b03a935d399509dd180e2301353d"
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
