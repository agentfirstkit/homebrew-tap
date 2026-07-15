class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.2/afdata-v0.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "e6745b366a8f6c61f27f48794bb1b085eab7c80d046ca902793b5aa030d3d43d"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.2/afdata-v0.17.2-x86_64-apple-darwin.tar.gz"
      sha256 "01fae7fc99a311144b55cf3c1333838bea444fbe9f22e4a9b58380c6d3469e31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.17.2/afdata-v0.17.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e6c06ca8210561469649edf94e3784495d5cde0a82ae574945e0e1d74dc59a0"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
