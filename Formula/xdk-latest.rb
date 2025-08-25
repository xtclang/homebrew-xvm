class XdkLatest < Formula
  desc "Ecstasy Development Kit (XDK) - A revolutionary programming language and runtime"
  homepage "https://github.com/xtclang/xvm/"
  url "https://raw.githubusercontent.com/xtclang/homebrew-xvm/lagergren/brew-tap/downloads/xdk-latest.zip"
  version "0.4.4-SNAPSHOT"
  sha256 "07d88f8b86de4c97728c952f86a2fc4ed881301def09f7a093d18983bbe9509c"
  license "Apache-2.0"
  depends_on "openjdk@24"
  
  def install
    libexec.install Dir["*"]
    
    # Fix the empty classpath in the shell scripts
    %w[xec xcc].each do |cmd|
      script_path = libexec/"bin"/cmd
      # Replace empty classpath with path to javatools.jar
      inreplace script_path, 
                'CLASSPATH="\\\"\\\""',
                'CLASSPATH="$APP_HOME/javatools/javatools.jar"'
    end
    
    # Install Unix launchers (xec = Ecstasy Execution, xcc = Ecstasy Compiler)
    %w[xec xcc].each do |cmd|
      (bin/cmd).write_env_script(libexec/"bin"/cmd, JAVA_HOME: Formula["openjdk@24"].opt_prefix)
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
