class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.28.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.28.1/afdata-v0.28.1-aarch64-apple-darwin.tar.gz"
      sha256 "7d31f6716db05dd133412ec8fc0a5e80b6315ec4173757418df86d20a6b02b3c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.28.1/afdata-v0.28.1-x86_64-apple-darwin.tar.gz"
      sha256 "e8593e93c324f4cd56ce5706bea1789d871e76c30b7b9f0db87da19c1979df82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.28.1/afdata-v0.28.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6288dbd022eb36f6d28c50a82ffe4629eb5338c38286e97e7af7dd56d199dbde"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
