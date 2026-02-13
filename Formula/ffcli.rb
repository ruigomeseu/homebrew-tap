class Ffcli < Formula
  desc "Fireflies.ai CLI — query meeting data from the command line"
  homepage "https://github.com/ruigomeseu/ffcli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.2/ffcli-darwin-arm64"
      sha256 "b92faf86cf8e8ca567e61c1b1c9bf56c1d012e1d1148edce00c9a20c18ab445e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.2/ffcli-darwin-x64"
      sha256 "843aa0b08a16d2ff3480a9226e12aa94b0b0b57c7562820f304378938805fc7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.2/ffcli-linux-arm64"
      sha256 "29436fbeb4bb49dbb2130e74ae2d9f8e194dbb53b602f815020dd2cf0faeaffc"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.2/ffcli-linux-x64"
      sha256 "49f4d19af6665c4bd7aaecb2abf43e5e213392c9e1d39e0f006700bc11351d54"
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
