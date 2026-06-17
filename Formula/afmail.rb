class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.2.1/afmail-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "1d6e1b0b5ec6110bdc51eb18a3bcac93c976d8af5e46a0a4b19a1223b2ef8418"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.2.1/afmail-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "2b3f39f42343f087d9d7376880785ba0ab478e0d8422486070d6722e2d832458"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.2.1/afmail-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "246e898c95c6c3716cf35bbe5673ff6bbcb7a950a0aab4802d4d6c3a902af674"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
