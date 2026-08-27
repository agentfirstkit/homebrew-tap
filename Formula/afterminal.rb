class Afterminal < Formula
  desc "A live terminal an agent drives and a person can take over"
  homepage "https://github.com/agentfirstkit/agent-first-terminal"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.2.0/afterminal-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c18a0f647180c592a9bf00231d8b0f3f2b36e5aecd7ae2b646206d4d3fe35a20"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.2.0/afterminal-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "6e25f328e89842273cd2740e3e6007d027407087389e1f7d56c0d8b3744598a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.2.0/afterminal-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88c177ee7625331da8d41be7f6e7e8793631824f268e03e0b1eb311ef6bd930b"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.2.0/afterminal-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e37f5ec6bf7d8bf7927d2d69a29086ca2081264753e8aa68ed92c4fd7467963"
    end
  end

  def install
    bin.install "afterminal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afterminal --version")
    assert_match "CLI reference", shell_output("#{bin}/afterminal --docs")
  end
end
