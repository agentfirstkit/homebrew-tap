class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.2/afhttp-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "1f8775ed12347f342ad534b1b0b2dbcd8c9901b531f4c7298004910ed3e2a69a"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.2/afhttp-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "95776245206e31eae25ba1ec83772b60f0496d94282affe4fa1e644d9428409a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.2/afhttp-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d70e72a4d2698f401e4c2fd28de1b33e7a6a3fad185a2cd1413fd2308d29ef61"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.2/afhttp-v0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "764174235de3628c58654ef8c23d04902e5c8fe24614fd23d72523b5e718f194"
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
