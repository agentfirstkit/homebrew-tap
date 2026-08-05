class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.9.0/afmail-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "6c62bf283c1c6654dafe5b9bd98f0c92339b58f103486739cc34f1fc7edcd2fc"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.9.0/afmail-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "94406d26a7ffa93f128033c0de48acf4006569580a77495d12ff2249535219aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.9.0/afmail-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "340928b136567aa6ccd7571f3330c6e14806e7db69c08d3628d26f2b5ee0baaa"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
