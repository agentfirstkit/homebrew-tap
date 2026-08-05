class Afpay < Formula
  desc "A payment tool for AI agents — send and receive across five networks through one interface, with spending limits you control."
  homepage "https://github.com/agentfirstkit/agent-first-pay"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.9.1/afpay-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "c79ddc9a3cb0c0f9b92c35d8e7e1da26cfd69e82588d5db8bfee0df2bbf7a13c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.9.1/afpay-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "8f7a13439d26041af4460c42d5e9cedf1f1d7fc263298581ce05675865b31838"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.9.1/afpay-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f9c8d8ec1d68dca945cb678f19fb9b3490942f143bdca533394a00f85881ca8"
    end
  end

  def install
    bin.install "afpay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpay --version")
  end
end
