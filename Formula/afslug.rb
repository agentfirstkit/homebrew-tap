class Afslug < Formula
  desc "Rust slug generation with explicit caller configuration for path and URL path segments."
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.1/afslug-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "cf8143394339b2a4db8a29fb249a29e84d86bbd986599b6f977ce1ecffee3064"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.1/afslug-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "9d5da8f23da71a8200b3f5f09a07b566a84a49616bc5ad741795851e394b8da0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.1/afslug-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "382414910d27a6d25147469d3161acdadc90f002f66125ff01bcd07cc6d3c5ef"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
  end
end
