class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK) - A revolutionary programming language and runtime"
  homepage "https://github.com/xtclang/xvm/"
  url "https://github.com/xtclang/xvm/releases/download/xdk-latest-snapshot/xdk-0.4.4-SNAPSHOT.zip"
  version "0.4.4-SNAPSHOT.20250913152955"
  sha256 "15d0959e6fed53474d5dc5616a0af7212d5f04e75b5b6b34cdb2359dd1495a19"
  license "Apache-2.0"
  depends_on "openjdk@24"
  
  def install
    libexec.install Dir["*"]
    
    # Install Unix launchers (xec = Ecstasy Execution, xcc = Ecstasy Compiler)
    %w[xec xcc].each do |cmd|
      (bin/cmd).write_env_script(libexec/"bin"/cmd, JAVA_HOME: Formula["openjdk@24"].opt_prefix)
    end
  end
  
  test do
    # Test that xec launcher works and shows help when no arguments provided  
    # TODO: The exit code test is technically correct to check for 1, but xec doesn't follow the accepted standard
    output = shell_output("#{bin}/xec 2>&1")
    assert_match "Ecstasy runner", output
    
    # Test that xcc launcher works and shows version info
    output = shell_output("#{bin}/xcc --version 2>&1")
    assert_match "Ecstasy", output
  end
end