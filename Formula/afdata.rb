class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.34.0/afdata-v0.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "8487af69a4f2ddf58ac5013d6bf234fa6f8c498cac8d17e981b5d683007d24d4"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.34.0/afdata-v0.34.0-x86_64-apple-darwin.tar.gz"
      sha256 "cfa896825508ffb49355e183182cb47b2775b5603df3ffcdebfcaaa9ad5dd68e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.34.0/afdata-v0.34.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72cbc5d2b820de0fa490c17d03e061a368517ff93bff1a628718ac246784a4f7"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.34.0/afdata-v0.34.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d912b854055ed32ad0559d39630d87f8d27cefafae35501dbf2c8303fa98ea0"
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
