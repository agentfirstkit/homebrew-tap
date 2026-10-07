class Afdata < Formula
  desc "Lint, render, and safely edit structured agent-facing data"
  homepage "https://github.com/agentfirstkit/agent-first-data"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.0/afdata-v0.35.0-aarch64-apple-darwin.tar.gz"
      sha256 "27ada0046fa7c0e05612c360b6e004afedee9a4706c2fe774a3578a8d8c736d6"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.0/afdata-v0.35.0-x86_64-apple-darwin.tar.gz"
      sha256 "b297d3c7315864ca6faa2dbd48003687ca5002a10b08151e6362cf53cf044fce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.0/afdata-v0.35.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0a86174f70d5ce1b7dba5c2e9a7b7d50bde5408bb9d92410323097ae537a169"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.35.0/afdata-v0.35.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da00fd4d46e625126f06200f2fdd0d3377f8ade823d845dff84ce62bdbb5952e"
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
