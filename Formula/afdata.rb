class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.20.0/afdata-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "3b7c8fe1f61d1b2a003a9e4a430c68c60aefee54e45b421b34f1e1b5beee61b6"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.20.0/afdata-v0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "2e966e4de0a0df8b6c1551c5d92c026857bbb5e026d82a4387d0a807ef2e104e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.20.0/afdata-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bb3c6921318e432bca1bdce3706ebc611a7178171a828547fd0f3e8251ff527"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
