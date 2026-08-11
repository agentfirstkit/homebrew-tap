class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.33.0/afdata-v0.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "5724962a21c4db8e532aa716d039b6faaf72c84e80570dab10df31ecfd941358"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.33.0/afdata-v0.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "eccc657fe7d83ba476d4561092c9040216f7733f36c2d66a10956b3ef4227cc1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.33.0/afdata-v0.33.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1fac1e88272a5c0f909ad912a6622f471707b6b9347c251841725a7e3d61f220"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
