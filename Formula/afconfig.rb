class Afconfig < Formula
  desc "Generic dot-path accessor for JSON/TOML/YAML configs, usable both as a **Rust library** and as a standalone **`afconfig` CLI binary**. The library is the primary interface: spores embed it to get `get_key`/`set_key` without writing a dispatch table per field. The CLI wraps the same logic for shell scripts and quick one-off edits from any language."
  homepage "https://github.com/agentfirstkit/agent-first-config"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-config/releases/download/v0.1.0/afconfig-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "df27a661dbad0a6fd02135d2d0b1427e101042f8153b75c04d6bff0ae2011648"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-config/releases/download/v0.1.0/afconfig-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "a46806aae5c85c2ae58543d8866e5e529a92ad4ef517a682c1f1ea120e093d9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-config/releases/download/v0.1.0/afconfig-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68f5d01e13cca05904f54820762c48d19accd5416f5a39d50b3ced44b490ac81"
    end
  end

  def install
    bin.install "afconfig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afconfig --version")
  end
end
