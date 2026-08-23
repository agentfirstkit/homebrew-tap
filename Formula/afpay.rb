class Afpay < Formula
  desc "Policy-controlled payments across multiple wallet networks"
  homepage "https://github.com/agentfirstkit/agent-first-pay"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.10.0/afpay-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "60903a8325092bb506f0ea4eb4927ef5a8a53f84775726bccfaa4514765569e2"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.10.0/afpay-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "7781f9ed2de3099068a8b9fc3ae2eba3f4244d81f7910a65e20d58e4c0eb1ca2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.10.0/afpay-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86a58c491746ac039be4040ba5dc47d86d8082a1839747f041cbe6ff38052d12"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.10.0/afpay-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af7ed20c7ae7c9f0629a9e5275ba057cdf025a2ca433ce174461ae9d22d76f57"
    end
  end

  def install
    bin.install "afpay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpay --version")
    system bin/"afpay", "limit", "list", "--data-dir", testpath/"data"
  end
end
