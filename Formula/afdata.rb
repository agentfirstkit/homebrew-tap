class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.37.0/afdata-v0.37.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f983fadaa756c2552396a148bd594fbca814f4b76d3b63da5b738ad4c75ae17"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.37.0/afdata-v0.37.0-x86_64-apple-darwin.tar.gz"
      sha256 "3998675aaf084f81a6a742bb8ee425124dbc9fdd8c2f2b134367f23427e65047"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.37.0/afdata-v0.37.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc2e58c17ff4e4593dd13a7858db09a887c23a2a07b1e99cfd4fe829983f257b"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.37.0/afdata-v0.37.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a2f838e30f197f92ceebd8759e703da94bdaae6edaac368d5601d485f0b081d"
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
