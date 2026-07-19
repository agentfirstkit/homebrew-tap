class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.7.1/afmail-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "5fbaf69698fd56ef9543ea9d245933c5bb1e5f5b268d7bec5223b23419ac66c6"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.7.1/afmail-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "caeffb30b1a0cf788c6e125c10abff452ccb6c130144b77d82852a4862400d6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.7.1/afmail-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "984cde4899cdcc13dc74115b0fa99ff64dcaa3347a27d9a8fd80963b88187c70"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
