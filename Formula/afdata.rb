class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.28.0/afdata-v0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "9c825a7bcea5f47ce6cf7c55e5901f5c23833f6d2cd8f6f91b3654f533ad5a37"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.28.0/afdata-v0.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "7dbb41f7eefd639bfc9268cdeb2bcbc3789f21bf72f447be68ff872028412f86"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.28.0/afdata-v0.28.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "22fa275476867a4cedd96dd7e219e931254d4a4e9b161ae9b5c77edf1b5e2828"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
