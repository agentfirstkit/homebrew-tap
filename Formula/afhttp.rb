class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.1/afhttp-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "09812f17f452da0e5ffa768eed8248a06270d4d72c6b3cb8c369a2ff46a2afe1"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.1/afhttp-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "a4dcc09b98ffe44d9e34129ed24eb7d6dc3b1aa9bcde19a4262a85946a36866a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.1/afhttp-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05d45ad720e2a58c4ff8433bc398a340f0124014ec47fccb8fcd40f389de3236"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
