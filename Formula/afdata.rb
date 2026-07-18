class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.19.0/afdata-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "5ffbd4f8ef1122eb8033f4a17288000896afc78b72e883a5af813194cabedec6"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.19.0/afdata-v0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "848f068976bbabc5534aac3a252d2777cf31cbb179b2678857b2f3c86ceb7564"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.19.0/afdata-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f58fa039c86ac0865ddf08b716fa7a3cd7044f11f4572ce154844925bd1a0364"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
