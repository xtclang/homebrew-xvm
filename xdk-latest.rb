class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.3ci827+76dad63303627725ef2f9a019ef8f3c68ac28ff3.tar.gz"
  version "0.4.3.827"
  sha256 "f86ff6acac18c9fa3200d3ab18b8f7ea40df96ea72d3845c8cf6f01a7bf85cba"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    osname = OS.linux? ? "linux" : "macos"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xcc"
  end

  test do
    assert shell_output("xec", 255).include? "Error: Module file required"
  end
end
