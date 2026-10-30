class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.0/afdata-v0.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "fcc5aa419836d1fe1b072b8e14890b2145ea8090c770a9aba20581f719091979"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.0/afdata-v0.36.0-x86_64-apple-darwin.tar.gz"
      sha256 "bcfe30a4c310d3836d625fc97b153966f1af6b81aa8e967d7a588cbaa34d041a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.0/afdata-v0.36.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "260d8d21a0b96ecd6426e428b31418ec73e6fdad2cecdc983e02430d92efa62c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.0/afdata-v0.36.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f8fc7383ac941fd1f1857471b309be827351d092cc6686b80e9ede8293a89e5"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
    (testpath/"valid.json").write(%({"duration_ms":25}\n))
    system bin/"afdata", "lint", testpath/"valid.json"
  end
end
