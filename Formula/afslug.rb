class Afslug < Formula
  desc "Rust slug generation with explicit caller configuration for path and URL path segments."
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.0/afslug-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "12efe6270513e165c74e0d8fed662e0d946dff0e0b2d4dcd76a107251a754eae"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.0/afslug-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "e6c6bbe9e79009191ff9eb63101981c5644547764e04585d322995a64ed6bc60"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.0/afslug-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89938004c90681dea90c4b1d15af5cdb5c30e65c01c17b5abc554653f54c3b43"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
  end
end
