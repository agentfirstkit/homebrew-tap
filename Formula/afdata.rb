class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.32.0/afdata-v0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "08cecb7c428c607df11815806dfe409104d466fde04ddce0d3f01967d96d7cd1"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.32.0/afdata-v0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "cde2c8e592d01fa0091c372483ffa151589c45278059c9b49f798df50096cb4d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.32.0/afdata-v0.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b2f296104b8d0c8420fa8406726cefd43441bf07b0c80a81a86e515d8c8841c"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
