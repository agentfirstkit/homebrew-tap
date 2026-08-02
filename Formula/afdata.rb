class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.29.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.1/afdata-v0.29.1-aarch64-apple-darwin.tar.gz"
      sha256 "722a58c5f1a6e9a72787c6d48c790ac6ab958fe43c0b3d38289ba8d918ecd0ac"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.1/afdata-v0.29.1-x86_64-apple-darwin.tar.gz"
      sha256 "82a98d815d7ddd3b6c42bf401c063770943b153f3f52e64d433fc6f367730954"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.1/afdata-v0.29.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "733bf1a2121683276239369d064fd54a16ec61a0997267b3bfcf125de297598f"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
