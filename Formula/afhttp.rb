class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.1/afhttp-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "8fc53c10d0491f9d2b21b1f14632f2c01e9fecb14067f93966f3b245670f52c4"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.1/afhttp-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "2e31b48e60a48ca26679ef276da36d508ef27869efd7fe31eea32a4d02f14b40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.1/afhttp-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82e704d88904c3aa53dccfbf8a76bbd1516651c85ba0cec1b0d24283a5371310"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.1/afhttp-v0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "857df4f29148983e0b03039863e76cc71beeca0c3c2009d9fe13150321bfea03"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
    assert_match "CLI reference", shell_output("#{bin}/afhttp --docs")
  end
end
