class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK) - A revolutionary programming language and runtime"
  homepage "https://github.com/xtclang/xvm/"
  url "https://github.com/xtclang/xvm/releases/download/xdk-snapshots/xdk-0.4.4-SNAPSHOT.zip"
  version "0.4.4-SNAPSHOT.20260827213402"
  sha256 "74cf9655558e831cfe97a00bd2e435d042077faac689fbb4cc7f082fdd513a97"
  license "Apache-2.0"
  depends_on "openjdk@25"
  
  def install
    libexec.install Dir["*"]
    
    # Install Unix launchers (xec = Ecstasy runner, xcc = Ecstasy compiler, xtc = unified tool)
    %w[xec xcc xtc].each do |cmd|
      (bin/cmd).write_env_script(libexec/"bin"/cmd, JAVA_HOME: Formula["openjdk@25"].opt_prefix)
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

    # Test that xtc launcher works
    output = shell_output("#{bin}/xtc --version 2>&1")
    assert_match "Ecstasy", output
  end
end
