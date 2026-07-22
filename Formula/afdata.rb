class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.23.0/afdata-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "6ccef1f1146ecadbe7b84113fcbfca58725ec6f1d48e2e8a912beddb1badc3e3"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.23.0/afdata-v0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "1f3dbbcef7746e0dd70158108cd980fd920f99f0966c443478c06a70590dee2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.23.0/afdata-v0.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c5081b3e6ffe38bd2214a30c4bf1eaca63774922bd016809d677826d8772142"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
