class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.1/afdata-v0.36.1-aarch64-apple-darwin.tar.gz"
      sha256 "6d320337488f68bad682190978e89f5c8b4bed6e7a644b3496c1b8903fc10a73"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.1/afdata-v0.36.1-x86_64-apple-darwin.tar.gz"
      sha256 "bb84166c1789034e01b3409ee357a11e170ce426c319a16d620c81d07ed3a6c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.1/afdata-v0.36.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4fbf740d8a121826599a8d79190a71c1666f0561964abf9dd9870e522581f3c7"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.36.1/afdata-v0.36.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "745c02875647f687a6e18377e8e8cba5b3871f666804e1076412873c4d87358a"
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
