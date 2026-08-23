class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.0/afhttp-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "4718dcc16388153957311725fdb2db9bcbb2d9f8b1da2a099f98557bd001ff07"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.0/afhttp-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "1195f9e0495af682a6e2532bd2405aa3959f309f1ac598f43337cdbc0e2124b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.0/afhttp-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9fced2f081e68d13ca944f752dc498fdfc86a97a7d29367b70f9929ebeac9a26"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.13.0/afhttp-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c7b341a4c2e204a1a894fba0b683c53ea9ab333628a21e71cde0da0dd41906d"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
    assert_match "CLI reference", shell_output("#{bin}/afhttp --docs")
  end
end
