class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.10.0/afmail-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "38647c2700b3200417bde5cbe8d3f2b1f832bf28b8ef540a48d3c7ec2deb7b3f"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.10.0/afmail-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "9a01ec0559818c37e7fa1480b6663bbde0bcebaa401faea52f4d3d73f87fb6eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.10.0/afmail-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14e4b389a2eb97c0bef3b09bba84976bf23390c170fe164d7e5ed75f7d46a610"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
