class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.14.0/afhttp-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "75ecfc28d2ceb5fae937f06da00f96dc99cac7e2d1a675acb6ef787c4dfbb3d7"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.14.0/afhttp-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "c3e794ff62cf800f5ffb06b7832b220c31e4595484fdeb8c516465d7a77caa87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.14.0/afhttp-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f2683d1f6e908a4844d3895e1776fa5001ccffae67a0e9df7740cffd0d33be0"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.14.0/afhttp-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "259f25646ef98f40043e3c80077ed10e619a082293e80db868256a5d8b8ba90e"
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
