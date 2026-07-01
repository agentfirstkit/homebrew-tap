class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.5.0/afmail-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "aed9b621eecb6ce7b7d113bb578cb50cff6858be9ed9e83b53d9dbf33dba9519"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.5.0/afmail-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "1c6ff3608ec187303d46ef30ca39e8defa875db68b154cdf062a11b3435b0a93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.5.0/afmail-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cc64c16875be36c34915aab010e5f02ec82a95890ad5fcc2a054ec3c4c15890"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
