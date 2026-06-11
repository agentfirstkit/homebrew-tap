class Afhttp < Formula
  desc "Give an AI agent its own isolated browser to actually open a URL — running JavaScript when the page needs it and returning the page as files the agent can read — so it works from the real page instead of a search guess, an empty app shell, or a login wall, all without touching the browser you use every day."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.0/afhttp-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "e97eff7f50a40e30a6850d83ed7ef0afb630bc1d56e356076ae18e98cd92d57e"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.0/afhttp-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ebf655e04e01ab183261734f22321431d107b9da4a0f73ce09d61b1f583a1cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.7.0/afhttp-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e24b02cb79aa0c18092d2bf75d51d2a8825b6b0045a3ee8127502278c930575"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
