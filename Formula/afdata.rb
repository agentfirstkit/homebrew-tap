class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.16.1/afdata-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "a96529c5c9b77ededa892cd981353874258372e2d912a1256b23f5c0d570f110"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.16.1/afdata-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "a3b3ec47634f6037cca28da21f4e5ba5e01458ef91f5f84dedb1275c3a3ad4d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.16.1/afdata-v0.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94a30a5509d59a2c7b93fd225a732d99e0b0d1416d9f6e1aa1d807325565c3b1"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
