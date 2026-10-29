class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.1/afdata-v0.35.1-aarch64-apple-darwin.tar.gz"
      sha256 "d1ebe418aeea9e2a10d53e5839da742089993cd383f250d48837316257710c09"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.1/afdata-v0.35.1-x86_64-apple-darwin.tar.gz"
      sha256 "0547c5b1b6ac7a141bedfff30aa5345716c466229e696ddc9653036dbe49fe10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.1/afdata-v0.35.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4559b55ba2c31c8b01d2080a20056e210227d299c2909f6ed59711a4ce7f0fef"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.1/afdata-v0.35.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d063324ddd5c1541e7276f3f7d9c2bbc7b107408b0ff2acec08fa8bcfe423e9"
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
