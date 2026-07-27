class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.0/afdata-v0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "06f249ed9d4593c8a07917826fe185e6126eb67ce3ed46311439e16787cde839"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.0/afdata-v0.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "f9abca48a6ffaad1c14e9a37a6ef00216501d4b314d445f671b4aa77cca371ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.0/afdata-v0.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce859c0686c0420045facd0b082cbbbe4f1fa224cde5b5724618e3bdc34cf447"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
