# Homebrew support for Ecstasy

This is a public repository for the tools, utilities, and libraries that
provide [Homebrew](https://brew.sh/) support for Ecstasy.

## Status:

* Currently supported on macOS only
* Requires a brew tap for xtclang/xvm

## Instructions

The first time you use Homebrew to install the XDK, you will need to add this
repository to your Homebrew. This is called "tapping" a repository, or "adding
a tap":

    brew tap xtclang/xvm

Then, to install or update the XDK, just run the following two commands:

    brew update
    brew install xdk-latest

## License

The license for source code is Apache 2.0, unless explicitly noted. We chose Apache 2.0 for its
compatibility with almost every reasonable use, and its compatibility with almost every license,
reasonable or otherwise.

The license for documentation (including any the embedded markdown API documentation and/or
derivative forms thereof) is Creative Commons CC-BY-4.0, unless explicitly noted.

All content of the project not covered by the above terms is probably an accident that we need to be
made aware of, and remains (c) The Ecstasy Project, all rights reserved.
