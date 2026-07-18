class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.19.1/afdata-v0.19.1-aarch64-apple-darwin.tar.gz"
      sha256 "448f46450c8257556fd68bc3261690aba1a2729bd86fa36cc0b86af772f670ef"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.19.1/afdata-v0.19.1-x86_64-apple-darwin.tar.gz"
      sha256 "ed5ae4d1a2c2ba37633fec5b9f9d0d5c645dccd2313ba90f3a946d11d7c081f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.19.1/afdata-v0.19.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "207d5f956a90c46ce93223331a9e383c3d7c32ac45bb670eeb2fe3a6d3f883fb"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
