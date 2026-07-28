class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means, plus a CLI and library for reading and safely editing structured JSON, TOML, YAML, dotenv, and INI documents."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.1/afdata-v0.26.1-aarch64-apple-darwin.tar.gz"
      sha256 "8dd50da788027854327f740e8c3834f49157056ed76c70ebda4058081b4377d0"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.1/afdata-v0.26.1-x86_64-apple-darwin.tar.gz"
      sha256 "3eddb0c5040731fb4a10c55335c1ced75068fe862710280e8fdfd610d9885402"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.26.1/afdata-v0.26.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5197501d054303c3038ae795c3517648e6131a88aeab755d7981df89a1f3d71"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
