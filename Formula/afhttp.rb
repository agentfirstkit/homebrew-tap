class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.2/afhttp-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "ca7d9d465d2a1e7cd70d8e3b6a98cbd143943d5141a087994fa812990dd7c558"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.2/afhttp-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "8aa52cce7c9636ad5fecb74d692babd2826a403235d6ad351d60856eafad42d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.2/afhttp-v0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd00049d7eb6fdf66705de78d5bb217a0a803f31df32626f09a1fd952a2e8de8"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
