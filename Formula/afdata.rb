class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.21.0/afdata-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "5a941140c24671d0185339a462fb9bce97638ada9651f485dd8fdc940af3809d"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.21.0/afdata-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "174da5abe9ce67256981885acfd11ab6584c33f4e026c260d56b76ed4d76b4d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.21.0/afdata-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "385611a05268ab377efcb4e2af19d0e784c4c9145afca1a6f970bec9194321bd"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
