class Afui < Formula
  desc "Let your AI agent hand you a real interface when a step needs a person — a window opens, you decide, and the agent gets a typed answer back."
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.3.0/afui-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "8a243e0d0c4904ab0901f068a3549456cda992547c55bf4cd026ee9c23c1ab18"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.3.0/afui-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "cc655f0525eab279f1270743b0ca31e3184a5dbe167acbf9137c06f4c932471c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.3.0/afui-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1faf05fa750383d4b5e841b2976f5e45f51030863deec5c59d0b521f8102693f"
    end
  end

  def install
    bin.install "afui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afui --version")
  end
end
