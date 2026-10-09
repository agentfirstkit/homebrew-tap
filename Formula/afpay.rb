class Afpay < Formula
  desc "Policy-controlled payments across multiple wallet networks"
  homepage "https://github.com/agentfirstkit/agent-first-pay"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.11.0/afpay-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "34e9c8357a15626e38d62d075ee1decae2f6b805ad9f4568607315d03e72cc3d"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.11.0/afpay-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "87df82cd847c9b7a454992f9eee8873402da5a2db87f2bf1696c22bb5aa096f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.11.0/afpay-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c9e07e673cd2015325154f45f15d8dc085c3179ff85beb2a4f7234fe35c1e41"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pay/releases/download/v0.11.0/afpay-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0e43c6c9e5be334277389de7025921f407b91a9cd30afacb3b47ff58425dba9"
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
