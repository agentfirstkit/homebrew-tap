class Afpdf < Formula
  desc "Article text, structure, and images recovered from PDF layouts"
  homepage "https://github.com/agentfirstkit/agent-first-pdf"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pdf/releases/download/v0.1.0/afpdf-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bd39e9f9e93950170d8b0db20978d17ebe944b71cc0af1edc746c411df8eb6b2"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pdf/releases/download/v0.1.0/afpdf-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "7e4a2c91900e0b5f7f455612a0ad99949b7aa2457fd3b52d8d5c490ba35125a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-pdf/releases/download/v0.1.0/afpdf-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4c02b98483c5a345698e3f826b0b92fe5e8069d43c846d058cead9d22b52a59"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-pdf/releases/download/v0.1.0/afpdf-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd9665a41f62a39d035a160dd5080958cc2934b09f3e6f2f79c7173b658c8ba2"
    end
  end

  def install
    bin.install "afpdf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpdf --version")
    event = testpath.cd do
      JSON.parse(shell_output("#{bin}/afpdf engine status"))
    end
    assert_equal "result", event.fetch("kind")
    assert_equal "engine_status", event.fetch("result").fetch("code")
    refute_empty event.fetch("result").fetch("pinned_build")
  end
end
