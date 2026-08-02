class Afhttp < Formula
  desc "Give your AI agent its own private browser — so it reads the real page, past logins and bot walls, without ever touching yours."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.10.0/afhttp-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "16343efd4b787d2be9efafef9301424e5fb5613e2a0be8b12cb89822264817bd"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.10.0/afhttp-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "22cf96e645411bc5d9c6a3431660cc00786eb6e6e1c8f3a93b1f38c5601998f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.10.0/afhttp-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a5abfb8e6a79ebc30511f4657ee0ebda7857e248bb4371d2027f854927e4bca"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
