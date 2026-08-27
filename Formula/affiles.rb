class Affiles < Formula
  desc "One directory, read-only, in front of a person who is elsewhere"
  homepage "https://github.com/agentfirstkit/agent-first-files"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.1/affiles-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "1754e290e253ac85e17b3e35e5a637779946902c4bd64892e746ee2ccad100a1"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.1/affiles-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "1d2f6b564ebb1de2590c9a4237a2e85d34d0e4f88c58b4dbee19d013ab8e623a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.1/affiles-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c832328a33b7cc686a4009826c9b61d2b892b57a4037d65785c8a797072fa87"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.1/affiles-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27078b1168a2cfde2f957c5262baa6af59f9bb025070eef9be46c50ba329c15e"
    end
  end

  def install
    bin.install "affiles"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/affiles --version")
    assert_match "CLI reference", shell_output("#{bin}/affiles --docs")
  end
end
