class Afterminal < Formula
  desc "A live terminal an agent drives and a person can take over"
  homepage "https://github.com/agentfirstkit/agent-first-terminal"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.1.0/afterminal-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "74a2213202ed6d499e14954013835fa87301fdf00ee434981d8f8dd93ee536b5"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.1.0/afterminal-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "837a0e9522b1c09b55899f6f51a9b04b0ee90f9ef366ace96e31e6d8d7e6050a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.1.0/afterminal-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2331e3147c68128f9f8c945dcb7a1846d0c5230b7c28143e33f866075d1c34e"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.1.0/afterminal-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2753cecdea869ca2030be105e4f49d92dbee1733ed57825e5d8e89fc331de8ff"
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
