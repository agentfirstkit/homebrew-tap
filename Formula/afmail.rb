class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.3.0/afmail-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "95b67244bfcfb0a14718e2b30f26ab9a9f95cf83028e1a5b6d9c0cd79f93996e"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.3.0/afmail-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "8c1be8b0e70a5d1fb39f02999214f038c6faafb860f55d61e8745f6cbd6970ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.3.0/afmail-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6603316fd95383ade2e737832b88c96e3166ec1c75d34ab72e51efa0934b4f0a"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
