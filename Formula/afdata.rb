class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.24.0/afdata-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "d7030b16694c488b04403dc26e42957a9860aed3590e973dec91449a336d2c72"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.24.0/afdata-v0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "2252abf5e7cb5aaebe18ac1d3d958b35fb92949b9bfa8b6fb14d1c78ed545ec3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.24.0/afdata-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87e67bd92df8d80547f70a0bdbcc57dd0e68f2945dfb48c9cc738bac71bd30fa"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
