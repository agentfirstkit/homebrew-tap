class Afpay < Formula
  desc "A payment tool for AI agents — send and receive across five networks through one interface, with spending limits you control."
  homepage "https://github.com/agentfirstkit/agent-first-pay"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.9.0/afpay-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "dee401f5eac2c304bbb0407315c9cfd7b1213f392076a12d630faab083d48111"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.9.0/afpay-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "075f840b46e62e6e8324d1b221b25b4c69cc8d234e9eb30cf2f02456c89d56d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.9.0/afpay-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b2b4484bdc0d91fc7273dac44d938bed6d00d78f6aeb108145484b61daf4180"
    end
  end

  def install
    bin.install "afpay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpay --version")
  end
end
