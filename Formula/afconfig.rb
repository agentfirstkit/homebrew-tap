class Afconfig < Formula
  desc "Generic dot-path accessor for JSON/TOML/YAML/dotenv/INI configs, usable both as a Rust library and as a standalone afconfig CLI binary. The library is the primary interface: spores embed it for generic dot-path access without writing a dispatch table per field. The CLI wraps the same logic for shell scripts and quick one-off reads or edits from any language."
  homepage "https://github.com/agentfirstkit/agent-first-config"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-config/releases/download/v0.2.0/afconfig-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "ffedf4ee565ad82743aa60e4cb1708db7693cc10fc3268e82ed608ec9886d629"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-config/releases/download/v0.2.0/afconfig-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a806019c16d5e89dec22ecdbe9c18a2c3a038968ef752715ee09141e187ef2a8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-config/releases/download/v0.2.0/afconfig-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffb707ef9601a06e949b69949fca0079c048731ebafa7e569eff07fb1e5316ce"
    end
  end

  def install
    bin.install "afconfig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afconfig --version")
  end
end
