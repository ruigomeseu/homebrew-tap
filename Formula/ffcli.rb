class Ffcli < Formula
  desc "Fireflies.ai CLI — query meeting data from the command line"
  homepage "https://github.com/ruigomeseu/ffcli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-darwin-arm64"
      sha256 "26f541b4bd0a1d848481dc499f3a22704d479bb1eed1ad304fb9d4bdd7474c1a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-darwin-x64"
      sha256 "e0408a46181e3575b0366a6aa008a4405c1b3ea42620edc9477188498630dcb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-linux-arm64"
      sha256 "31497670647e9c8d53598aeaa7588a781d807dde356f003b5917647bb16425de"
    elsif Hardware::CPU.intel?
      url "https://github.com/ruigomeseu/ffcli/releases/download/v0.1.3/ffcli-linux-x64"
      sha256 "68964408dba4c1fa0aeb402ccc8000f2daa785a6fcaf7923145cb69b3e090cac"
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
