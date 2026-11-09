class Afslug < Formula
  desc "Deterministic Unicode slugs for filesystem and URL segments"
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.1/afslug-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "028f1c79fd99f4bf214cbdd17a9bd2b182e819c681489c0742aeecb24f9c0703"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.1/afslug-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "f30a6950b00e7849f08dfd41aa877bd830dfad042525258ccb36162487e7cda8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.1/afslug-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94a1594624d6b6e62574e8f5b15a393c785bdf3fbb8a8db14253fb24ec2a3176"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.1/afslug-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b94cb61e37733bb555350ca76af7e6cdae52052ffb53f0085524676c9c37a9b5"
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
