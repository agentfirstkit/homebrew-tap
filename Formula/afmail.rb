class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.7.0/afmail-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "6df1d513a13795c58b28934f7523835540460995cd3058888723463c1617a379"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.7.0/afmail-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "daf62c3284f91c80c21f4bc4aa80a19852f6a17a6a9e089de5a17ba3f6fe0699"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.7.0/afmail-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bf8b735938d291407110d2cb96608d10982ea1da0f33e8e31eaf9e607f2bf2e"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
