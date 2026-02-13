class Ffcli < Formula
  desc "Fireflies.ai CLI — query meeting data from the command line"
  homepage "https://github.com/ruigomeseu/ffcli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-darwin-arm64"
      sha256 "28edb03d06cbf988e80770f924f56d4fb13f1a26757b25903ce7c5fcda6827bf"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-darwin-x64"
      sha256 "2bbe692dae9a3cd1d1934eb17838d121d36c3db0fe2e7f322524d3d9484093c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-linux-arm64"
      sha256 "d78006b09e77837fd5df268f04256d46f134b5e49df5765816f12891adc29607"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-linux-x64"
      sha256 "1648fa26ff00e9b262b733293b41df953cb2a4df9e2023237c524e192fc8f80c"
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
