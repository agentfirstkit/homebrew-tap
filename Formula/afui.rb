class Afui < Formula
  desc "Let your AI agent hand you a real interface when a step needs a person — a window opens, you decide, and the agent gets a typed answer back."
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.3.1/afui-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "ebb1d879b9839e638f037b76741c3094bf16b053e76a714828609b09e061d533"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.3.1/afui-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "9cb5d74f1d67fe986e7e188c76be9d0d0d911b2a4d7a1ccbb794e2a66b48e6f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.3.1/afui-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7085abd4d0f8ecd3638b5f3e484cb3cf7145c1121c85dec9fda621e93a9e8f3d"
    end
  end

  def install
    bin.install "afui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afui --version")
  end
end
