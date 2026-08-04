class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading Markdown structure and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.31.0/afdata-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "54404dee553ab3d6a5f41f27340fbebe311caf5f7937ee28ee56f48091e71053"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.31.0/afdata-v0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "ea10ce3002b2f48674dab569cad716c5d49b874b6c201e6da42b99760a5fa5e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.31.0/afdata-v0.31.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdc676e914c74861c997e1687785aa28c4681dcb266c622706de11dc8b2392ef"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
