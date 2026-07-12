class Afdata < Formula
  desc "A naming convention that lets AI agents understand your data without being told what it means."
  homepage "https://github.com/agentfirstkit/agent-first-data"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.16.0/afdata-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "6995094ecd718185d868209744ffdd224045bb2dadcdc57df67025c7b6f62173"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.16.0/afdata-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b8c06d6bc18913b5a2426e2fd09df354725ef1198b26412022a973a98dcf108"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-data/releases/download/v0.16.0/afdata-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09801d1f813b1a415108826399cb16b26fdeef5f8556173036a6218185026353"
    end
  end

  def install
    bin.install "afdata"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afdata --version")
  end
end
