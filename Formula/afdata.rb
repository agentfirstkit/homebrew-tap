class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.22.0/afdata-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "a5daedf1b32a9de0639b2ff56664c18c12f03f1ac84912ded7aa5ec4a1d7fbec"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.22.0/afdata-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "9c54dc678c93dd4a3ead260cf928a0906588a27becebc8101194a9dc3fd81f8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.22.0/afdata-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99fc33b50ce129f840895c886cb8d3a11140ae0983d8ac63efbb701b1afab343"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
