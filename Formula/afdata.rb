class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.26.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.2/afdata-v0.26.2-aarch64-apple-darwin.tar.gz"
      sha256 "44c4aa735831474a1dde09c9cb34e19f648f5231bed10a27aedb8516ac6fefac"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.2/afdata-v0.26.2-x86_64-apple-darwin.tar.gz"
      sha256 "3d983c4ba32a6b0c342e5b872907800d0249cbbecfc9b2cd0247acba71e754bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.2/afdata-v0.26.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a2d16069e00a8701599a1a01698afce0490e6d729d30c736f3fdfbe60500d2f"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
