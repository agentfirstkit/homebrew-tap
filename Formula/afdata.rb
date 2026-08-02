class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.29.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.2/afdata-v0.29.2-aarch64-apple-darwin.tar.gz"
      sha256 "b28053fbca273c3a73cf3acb24f28e938d1c46c7b1abfc040a11ae5f0e2d1eb5"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.2/afdata-v0.29.2-x86_64-apple-darwin.tar.gz"
      sha256 "59af12fad923c940eb361737d9b2ead89c0efc115eef62e5215b8e94d7d65415"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.2/afdata-v0.29.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2667aade795e32b9bc5404480af7c99f7c86b0c5ec622ebb1373876c662b40a"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
