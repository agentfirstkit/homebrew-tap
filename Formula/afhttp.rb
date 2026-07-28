class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.9.0/afhttp-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "eec319d3ac5df9a6c5f93416366ce631ace3e3f43b4f2e2677e0a6b2a4f5cbf8"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.9.0/afhttp-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "55f7e3f85b67743a567adf03e338b08283d264f26dbf97507b88fe7c5e307782"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.9.0/afhttp-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e52997d1864f57a2fa1f28774368d346aa8d319d1e27aabd454b84a142260a1"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
