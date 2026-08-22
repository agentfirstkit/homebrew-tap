class Afslug < Formula
  desc "Deterministic Unicode slugs for filesystem and URL segments"
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.0/afslug-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "344c462ff80754b9301be683acf8bb5b208ac45f13853297e11272f5c65eada5"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.0/afslug-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "1db2282d81b78b03c24f1b84e23c674f08cfbfce11a9ecc7f256e3937e99e8a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.0/afslug-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5735eca7f89e8109c2448b654e993add1454f1121a5479933ae410b3553e9c78"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.0/afslug-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ed3e5e828d866ee0971a4069ab1130d48ab025b31ca38628708ff18ba92b61b"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
    assert_match "hello-world", shell_output("#{bin}/afslug slugify 'Hello, World!'")
  end
end
