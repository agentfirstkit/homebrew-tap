class Afpay < Formula
  desc "A payment tool for AI agents — send and receive across five networks through one interface, with spending limits you control."
  homepage "https://github.com/agentfirstkit/agent-first-pay"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.7.0/afpay-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "6953b7ffdcb0954578fa769d29f78596cb8139c2c5db1865df045361ab59b320"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.7.0/afpay-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "cd41f06221fd094ba9f3e388deb6134b21838d1e428890b2b798b5618f3bbb9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.7.0/afpay-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce736c1308f2a2aaa36fb2cc61bc5a7ee2a9d2b530152c6b43620cac4cd9cc1e"
    end
  end

  def install
    bin.install "afpay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpay --version")
  end
end
