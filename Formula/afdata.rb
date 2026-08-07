class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.32.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.32.1/afdata-v0.32.1-aarch64-apple-darwin.tar.gz"
      sha256 "ba2c36f400dc10f2ca1058fe3a6955df7f5ffb526a2f0bf1966227c0576b3689"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.32.1/afdata-v0.32.1-x86_64-apple-darwin.tar.gz"
      sha256 "0def2649ddb13919d48e8332e1476f061495fa2e98b4b2d8ec1ac32b25f2235a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.32.1/afdata-v0.32.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e9e3be7343d0c96e8711d70e99e056935299b590a313bbe781d0cfece3b8423"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
