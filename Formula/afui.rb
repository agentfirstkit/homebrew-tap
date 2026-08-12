class Afui < Formula
  desc "Let your AI agent hand you a real interface when a step needs a person — a window opens, values can stay live in both directions, and the session ends with one typed outcome."
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.4.0/afui-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "c6e84198068b6e5905409a0b9ac35c64a5d7eb7ecd54ad6e81fd3bbc860e3053"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.4.0/afui-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "6dc8f61209a9ef0d8d0bc91212e00e25602a1216e06562d83115a00ba19b2b07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.4.0/afui-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d92c6aeeee97a8fa4025a3a56ca215cf1fc2bcba1eb84e19276668c6fd132477"
    end
  end

  def install
    bin.install "afui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afui --version")
  end
end
