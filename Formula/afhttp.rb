class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.3/afhttp-v0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "314ac4eeb655d7a319386cb0c6cfe5ad87319ece0ed9cca80c24105055530c2c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.3/afhttp-v0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "3e7737051087e10880296cb9ce4b77fe37cd1b5018da621fcc737c29761b3298"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.3/afhttp-v0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dded8ff7146d0db0bbc1740ff881a70ce87fd68c48a24a53701163567dd355c"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
