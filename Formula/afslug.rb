class Afslug < Formula
  desc "Rust slug generation with explicit caller configuration for path and URL path segments."
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.4.0/afslug-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "123ed13573c9d410181195bd738092adb14e3a3ecdae80d30b88fca653483fb9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.4.0/afslug-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "214da94cbbf77cf49ffbcf588f6125971143bd796041511aa5a5249f96321790"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.4.0/afslug-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4784d1c902cd8cdf2f4701686fd5f84c5cc7b4ee85ab30dd6e0b6588bb637970"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
  end
end
