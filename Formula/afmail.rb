class Afmail < Formula
  desc "Local-first inbox triage, drafting, review, and delivery"
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.11.0/afmail-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "022b5ae0884aaa89f0cd7f553bd743e13016fed88dc4a0fe4b1703428740870a"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.11.0/afmail-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "8d39ef504ed2490bcb8127d82688434ecd02b5f75daea05c0f0848941c8a2294"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.11.0/afmail-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eeced0720d6e4d90fe9d082466a32b8a1aaac966051592f73a18d60448ce3aac"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.11.0/afmail-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e025034d07806503f135a646b33e9170db12b7e77dcee824335595a2dcce4aa"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
    testpath.cd do
      system bin/"afmail", "init", "mail"
      system bin/"afmail", "doctor", "--workspace", "mail"
    end
  end
end
