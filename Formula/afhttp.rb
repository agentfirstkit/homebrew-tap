class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.11.0/afhttp-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "48c761c4eb33de6acf66f7736a0902ad2799e9e2f57fcc04c805317dbd5f0255"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.11.0/afhttp-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "dcfc4cc3b6f861fc4e0c2ad4eabb9b7424ebf19c8c83459091b81bb525dd6562"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.11.0/afhttp-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0eef909668dd196d1d012bfffccaf4635563054ae67b57cdb1634a2c980c8d98"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
