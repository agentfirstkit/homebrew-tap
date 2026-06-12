class Afmail < Formula
  desc "Give your AI agent a mailbox it can actually work in — your mail pulled down into plain files it reads, triages, drafts, and files entirely on your machine, with nothing sent or changed on the real mailbox until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.1.0/afmail-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "6d8a5e299829a859fbb753bf27c165aa49f64bd549af07713b9ed1f2f7508637"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.1.0/afmail-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8c1d2b1b9b511aa895ce6ab43a268ac450976eb8961ec63795232c5b8ba26da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.1.0/afmail-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59b7071e43f455bd5fd2e7b20cafcc65e53220491687e57bc610e55c28e8645b"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
