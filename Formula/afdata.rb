class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.1/afdata-v0.38.1-aarch64-apple-darwin.tar.gz"
      sha256 "bbb6f06d8455f6a7707faeb6b21efca60fb92f3e79d30de6229b6604ecc8d36e"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.1/afdata-v0.38.1-x86_64-apple-darwin.tar.gz"
      sha256 "fbc39e764653ee9bbe2882a40d9b35b16ee559062bc2f9885c3fbfd9c485e9c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.1/afdata-v0.38.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62ba1271b1e683e368901c0c1153fbb14c55c51bbcea3feb6f62a803e2c7ded1"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.38.1/afdata-v0.38.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "521c425fa888489607c915987c38954e758bf1a2cdea13b3fe5b12539479f827"
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
