class Ffcli < Formula
  desc "Fireflies.ai CLI — query meeting data from the command line"
  homepage "https://github.com/ruigomeseu/ffcli"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v#{version}/ffcli-darwin-arm64"
      sha256 "PLACEHOLDER"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v#{version}/ffcli-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v#{version}/ffcli-linux-arm64"
      sha256 "PLACEHOLDER"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v#{version}/ffcli-linux-x64"
      sha256 "PLACEHOLDER"
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
