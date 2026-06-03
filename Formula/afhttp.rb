class Afhttp < Formula
  desc "Give an AI agent any URL and get back a usable page — fetched directly, or rendered in a real browser when the page needs one — with a human able to take over the same browser for a login, captcha, or 2FA."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.5.0/afhttp-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "47607e1a7d61776738a0d0b56230fde4b327003c98dbf386759d8c307baff97f"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.5.0/afhttp-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "735acaea4323936a7a9bd5130930e694eb75a57251f84af14de0509e2172c7e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.5.0/afhttp-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54059b1ff4e88cac79448015a574379efbc59c8271c77a1e74047dd671649c77"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
