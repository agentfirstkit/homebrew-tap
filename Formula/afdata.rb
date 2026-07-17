class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.18.0/afdata-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "7d0084da4b784d21d73db57e424a0cef236cf2b755f8a5404214f465078ac7db"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.18.0/afdata-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "45be70473d08e07da8c84cee52650376044265b72588e8d10f009a92e8d9ee34"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.18.0/afdata-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d68e31cb814f449823b7de99929b03a89581f8f7f5072aea0078daa686dacdd"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
