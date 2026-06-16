class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.2.0/afmail-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "da727eafc33be79816abc35e303cf777936fd4215c66c9b4c22a099e5408d8ed"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.2.0/afmail-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "13fe58191be8ef3394afcb2c34486e44fc3484f3a94c322c2d0ca0a6fbf9c126"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.2.0/afmail-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "692cdb0f41f228ee046c38c1a13858ff0e6e060e0892dc9ace0cee6d57f9fc5a"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
