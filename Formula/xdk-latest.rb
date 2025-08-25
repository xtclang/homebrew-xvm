class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK) - A revolutionary programming language and runtime"
  homepage "https://github.com/xtclang/xvm/"
  url "https://github.com/xtclang/xvm/releases/download/xdk-latest-snapshot/xdk-0.4.4-SNAPSHOT-scripts.zip"
  version "0.4.4-SNAPSHOT.58052ec454e0c4eb29c434cb8a82e88ef72abc77"
  sha256 "862dc002c14cedba1dd6d69fe472614d0f331a8712bb66918f16a9c98d8319a1"
  license "Apache-2.0"
  depends_on "openjdk@21"
  
  def install
    libexec.install Dir["*"]
    
    # Install Unix launchers (xec = Ecstasy Execution, xcc = Ecstasy Compiler)
    %w[xec xcc].each do |cmd|
      (bin/cmd).write_env_script(libexec/"bin"/cmd, JAVA_HOME: Formula["openjdk@21"].opt_prefix)
    end
  end
  
  test do
    # Test that xec launcher works and shows expected error for missing module
    output = shell_output("#{bin}/xec 2>&1", 1)
    assert_match "Missing module file", output
    
    # Test that xcc launcher works and shows version info
    output = shell_output("#{bin}/xcc --version 2>&1")
    assert_match "Ecstasy", output
  end
end
