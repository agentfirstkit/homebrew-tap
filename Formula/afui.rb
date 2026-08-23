class Afui < Formula
  desc "Typed local interfaces for agent workflows needing human input"
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.5.0/afui-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e46e2b896ac2a60f97a9d5c49daf4ae1f9c4571790782e1784f47a19f2bf191b"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.5.0/afui-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "57d7240f3523c65dad8d3e7296ac94fe9407fc62c46d0a7884bb0a7b5661431b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.5.0/afui-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9fee771cc8477fc67d0019132ef57d6278d9e9a3d0df17345a737bd8bccec1a"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.5.0/afui-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f3a06e7612eb356b7eac2f1e5b58dac46b48a9c8a28ca7725b1df6f3f6b2c26"
    end
  end

  def install
    bin.install "afui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afui --version")
    assert_match "CLI reference", shell_output("#{bin}/afui --docs")
  end
end
