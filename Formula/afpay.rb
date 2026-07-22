class Afpay < Formula
  desc "A payment tool for AI agents — send and receive across five networks through one interface, with spending limits you control."
  homepage "https://github.com/agentfirstkit/agent-first-pay"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.8.0/afpay-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "13c6849de10b1c6ba36a812f2bdabb6282bade9bcaf9fb2889ac5865f33c8e3e"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.8.0/afpay-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "2a06e81f4f5f6e6a39a2687fcb174c3a45526888285c5094f40f5813bd8d538e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.8.0/afpay-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "398f59097e15abda3c363f2dab649c7a1ac0e21a389f43c9b113c77d7703c65d"
    end
  end

  def install
    bin.install "afpay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpay --version")
  end
end
