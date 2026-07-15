class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.0/afdata-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "799e7f78fa280dbe439b687028247124343f8a4cdc2b2e401e90fb03e8d8a7d6"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.0/afdata-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "6fb74dcc64f7099c3ca85af325506c04efcc062effbf83d76c0620efdc1b0adc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.0/afdata-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f892c4678757bc3cd838d52f0a56bed27b621838580891cf4607a94ec5c7a48f"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
