class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.12.0/afhttp-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "18c00a0790159a8192948af7c73ae7ae799da3ce5a9c7369f51ce61a33c61cb9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.12.0/afhttp-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "d14db683b9ba8d9f87221756ff1b693b3739dbb9d1f5d63a3d601107317422b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.12.0/afhttp-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e74b8eee4bb2a174f8bbf36cd6139b941be263c9d436bbead6c26cc7392a6fb"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
