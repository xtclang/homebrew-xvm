class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK) - A revolutionary programming language and runtime"
  homepage "https://github.com/xtclang/xvm/"
  url "https://github.com/xtclang/xvm/releases/download/xdk-latest-snapshot/xdk-0.4.4-SNAPSHOT-scripts.zip"
  version "0.4.4-SNAPSHOT.fa31db589a1dac167a1d83fa0d220a99311b5527"
  sha256 "16bb0e01e047b519a49e7061399e8c366c3faa5692cbdee0b3ac897e8b145b39"
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
