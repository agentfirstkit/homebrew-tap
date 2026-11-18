class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.0/afdata-v0.38.0-aarch64-apple-darwin.tar.gz"
      sha256 "ba2bd9930518998d14b46095a864965f04195107d2712237b299c95b468d3ba9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.0/afdata-v0.38.0-x86_64-apple-darwin.tar.gz"
      sha256 "cef35f470c6dc9fa151bae59e2c38bb6be6dc4c3230cc2b0295d5cce9b256402"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.0/afdata-v0.38.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d29b073892dc0d6558ec5b88291514fdbbc7f63769e4ed82cc4d6e2aa71e9cd5"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.0/afdata-v0.38.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0852fb366738ea5580717eaf9cd25c2a8607988c723568b914a74460cb1bc07"
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
