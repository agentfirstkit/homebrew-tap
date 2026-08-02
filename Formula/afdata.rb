class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.0/afdata-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "51c070de15aa78efd4913490dfc8609251dfd74fb51c3b046901a93c2b5196f0"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.0/afdata-v0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "fce6a7f947ec26ae374ae6d1eefb792db92cab91ac0054f61857eb5f9151516b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.29.0/afdata-v0.29.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "216c2ac1ce952d9365a87d627f5c72393fee483f91d0737f4085b1d3b784046e"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
