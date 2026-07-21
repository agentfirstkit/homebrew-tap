class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.8.0/afhttp-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "2c1131fa84eb4136994d1a9af5f35c8dae3574a24343b9d8ecfebfc4fd06b71d"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.8.0/afhttp-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "f6d68ad6d71c49b1386893552d49408ac0599453e785ad4233d1cbd2636eb216"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.8.0/afhttp-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1aee27d235b9561469085ce14583592e3a75227c37612f7b00969fb871eaa371"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
