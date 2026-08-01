class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.27.0/afdata-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf383575de033986d8880cefbffd0e55b9a851d93093aae64017fc0627c9ab87"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.27.0/afdata-v0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "31adae7e501fda8025e280b441f8ee7ef7d97f4d93e31b49f09db7eb23b9f671"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.27.0/afdata-v0.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "025e7b9397f41604e1070a681a6bb5a2a56ae1e4cf7974989a8d6a183168befe"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
