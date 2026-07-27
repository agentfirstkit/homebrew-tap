class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.25.0/afdata-v0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "d90cbcd3528cdb7e30b016e2cac85b2344ae6f44de40a368f2b3a813a1281046"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.25.0/afdata-v0.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "e955147a2441816afcd4fe4af0829e9e0095125e17ce2f991ea479bc24b62f50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.25.0/afdata-v0.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9febda0c42116215bf43b28dfedc533a78838195a7d41ce7ab325f3022bc607a"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
