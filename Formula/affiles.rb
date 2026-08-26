class Affiles < Formula
  desc "One directory, read-only, in front of a person who is elsewhere"
  homepage "https://github.com/agentfirstkit/agent-first-files"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.0/affiles-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ace09637f72832aa078aafbce8d8bd831ceecaffdf3688f6e1dc0ec052877a2f"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.0/affiles-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "7aef838bc3f9c31efc7432f43ba1ba07f8ffd202303aeb911846186ba3d2a112"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.0/affiles-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fa9fec03238f8b642fde4c9476e77836ab042de82dd164a6048603735d92127"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.1.0/affiles-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c0591672495f2284503137e35b2ba73001c5804680e6bcb71900431708c1739"
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
