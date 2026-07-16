class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.17.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.3/afdata-v0.17.3-aarch64-apple-darwin.tar.gz"
      sha256 "fa794071485cc914f785e57d55faede0c0b33ea9c735b435c9c40469a3e2c736"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.3/afdata-v0.17.3-x86_64-apple-darwin.tar.gz"
      sha256 "e835f8c0ba1da44130025746d95ad07bcf3f4e7174db37da36628f27ae5f3133"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.3/afdata-v0.17.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "302c94890d859ec51ec138d7df40cfea89596bb55798df28c0f56b41ac6f8384"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
