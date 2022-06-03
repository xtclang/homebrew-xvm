
# brew: formula design

see:
* https://apple.stackexchange.com/questions/277606/why-are-all-the-homebrew-formulas-located-in-the-libexec-folder

xdk build looks like:

    /xdk
      /bin
        macos_launcher
        ... 
      /doc
      /examples
      /javatools
      /lib
      README.md

after running the macos_launcher it looks like:

    /xdk
      /bin
        macos_launcher
        xec             // copy of macos_launcher
        xtc             // copy of macos_launcher
        xam             // copy of macos_launcher
        ...
      /doc
      /examples
      /javatools
      /lib
      README.md

brew install needs to shift the content down under libexec and do the work that macos_launcher does:

    /xdk
      /0.3
        /bin
          xec             // symlink to ../libexec/bin/xec
          xtc             // symlink to ../libexec/bin/xtc
          xam             // symlink to ../libexec/bin/xam
        /libexec
          /bin
            macos_launcher
            xec           // copy of macos_launcher
            xtc           // copy of macos_launcher
            xam           // copy of macos_launcher
            ...
          /doc
          /examples
          /javatools
          /lib
          README.md

the reason is that the contents of /xdk/bin get symlinked into /opt/homebrew/bin

use bin.install_symlink to do this:

    bin.install_symlink "#{libexec}/bin/xec" => "xec"
    bin.install_symlink "#{libexec}/bin/xtc" => "xtc"
    bin.install_symlink "#{libexec}/bin/xam" => "xam"
  
See:
* https://github.com/Homebrew/discussions/discussions/546
* https://github.com/dotnet/sdk/issues/4600
* https://github.com/Homebrew/discussions/discussions/553
       
# versions

names:

* `xdk` - latest stable version (in homebrew)
* `xdk-latest` - latest CI build (in `xtclang/homebrew-xvm` repo)
* `xdk@0.3` - once we have versions that we may want to go back to, the latest stable
  build of an explicit major or major/minor version 

background:

* [specific version of formula](https://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula)
*
* [installing and pinning specific old formula version](https://remarkablemark.org/blog/2017/02/03/install-brew-package-version/)
*
* or with version in the name e.g. "xdk" vs "xdk@latest" vs "xdk@0.3":

```
    brew unlink xdk-latest
    brew install xdk@0.3
    brew link xdk@0.3 --force
```

requirements:

1. a command to update an explicit major or major/minor version
2. a command to use the current tip as the latest stable version (which also will
   update the corresponding major/minor version, and major version if appropriate)
                             
examples:
* [versions of "solidity" library](https://github.com/ethereum/homebrew-ethereum#readme)
* [openjdk formula](https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/openjdk.rb)


# taps

doc: [How to Create and Maintain a Tap](https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md)

blog: [Creating Homebrew taps for private internal tools](https://medium.com/prodopsio/creating-homebrew-taps-for-private-internal-tools-c41363d58ab0)

blog: [Distributing private tools through homebrew](https://vanwollingen.nl/distributing-private-tools-through-homebrew-d046761fb3a1)

# brew: other

* [ruby doc for install_symlink](https://rubydoc.brew.sh/Pathname#install_symlink-instance_method)
* [cheat-sheet of brew commands](https://devhints.io/homebrew)
* [brew overview by a user](https://opensource.com/article/20/6/homebrew-mac)
                                                                     
# github releases

* [github releases doc](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases)
* [github CI doc](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration)
* [github "runners" doc](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners)
* [github latest linux VM info](https://github.com/actions/virtual-environments/blob/main/images/linux/Ubuntu2004-Readme.md) -
  already contains Java 17, Gradle, etc.
* [github VM pricing](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions) - 
  free up to 500 MB and 2,000 minutes per month
* alternative: [self hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners) -
  _"We recommend that you only use self-hosted runners with private repositories.
  This is because forks of your repository can potentially run dangerous code on your
  self-hosted runner machine by creating a pull request that executes the code in a
  workflow."_