class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.6.0/afmail-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "96145aad88ee81736262352eee0f7239e4dd20a13d190a1c36d2b5fb94695637"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.6.0/afmail-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "61b96c9c480338b2f07b2ccf165a4cf0d5154227b43cb2dbe119aebd00c7845f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.6.0/afmail-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e49b1de20aff88608e1fb34bdd0a9b3640947fb44837990d31795275dc4d4c0c"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
