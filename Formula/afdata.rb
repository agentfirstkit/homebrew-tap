class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.1/afdata-v0.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "b31f865f1dceb8fa5cc9eb3b057c1d9e888aa84c9166d4133d10ae934a64e6ca"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.1/afdata-v0.17.1-x86_64-apple-darwin.tar.gz"
      sha256 "4aee8b017b609db1e033e6e1c3bb27504cc173362930b001bc15877afd778b7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.1/afdata-v0.17.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95fea5b05cafe00b888260423dd95ec3d0bca7dc3996aac4285ae13a462d2518"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
