class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK)"
  homepage "https://github.com/xtclang/xvm/"
  url "http://xtclang.org/downloads/xdk-0.4.2ci46+71cd9cc5832038462d54cb0b84f4ce141e02b47f.tar.gz"
  version "0.4.2.46"
  sha256 "b0b5217abf05de986e6211a7c8665b304fa89df1726749e4f1dd7eff1cbbe1fe"
  license "Apache-2.0"

  depends_on "openjdk"

  osname "macos"
  on_linux do
    osname = "linux"
  end

  def install
    libexec.mkpath
    cp_r Dir[buildpath/"*"], libexec
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xec"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xtc"
    bin.install_symlink "#{libexec}/bin/#{osname}_launcher" => "xam"
  end

  test do
    assert_equal "Error: Module file required", shell_output("xec")
  end
end
