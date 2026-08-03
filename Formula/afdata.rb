class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.30.0/afdata-v0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "1217db1ffea66370264951a3f1f3bf248ea032d0e31988f25a95fca94945357d"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.30.0/afdata-v0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "9f9a621cd26beb7c4214ba4204b965cd87b496326d48498c3727e3c8cea5bba3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.30.0/afdata-v0.30.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dee2e22e68dec943c6be15cdcb4c1a24db07a4f56eab763524ce40a924f5700a"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
