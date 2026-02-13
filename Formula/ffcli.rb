class Ffcli < Formula
  desc "Fireflies.ai CLI — query meeting data from the command line"
  homepage "https://github.com/ruigomeseu/ffcli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.1/ffcli-darwin-arm64"
      sha256 "0e54f680b21b2e05cce45e76b85941e4286667896dbf265dba5eb52d1989007a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.1/ffcli-darwin-x64"
      sha256 "b502c84a17f5bab9da5d4860b054f2a985a6f2f9a5110cf3a52c633c9faf2c34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.1/ffcli-linux-arm64"
      sha256 "ea8bc18c00e06a2a74b5711552ed5ce142b0ac284cf214a435ca1e8a37888126"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.1/ffcli-linux-x64"
      sha256 "5c899431cda6eb2fd0c9f306ede0a0364edff739e32502f5f47f411e22432dcc"
    end
  end

  def install
    binary = Dir["ffcli-*"].first
    mv binary, "ffcli"
    chmod 0755, "ffcli"
    bin.install "ffcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ffcli --version")
  end
end
