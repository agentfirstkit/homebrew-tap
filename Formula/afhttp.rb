class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.10.1/afhttp-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "bf33a47bf5713d04c464e7ad054b84aa595f124a69289ad4502f3c2876cfd4fc"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.10.1/afhttp-v0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "9de70b531a923d7bf4ebf5a662053e35f6127c6be6be156f145b5fbd1cbc3f1f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.10.1/afhttp-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e08c652cfcce955ac839052372b33fa3cd3c14b884619eaa9b675874c2302ad"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
