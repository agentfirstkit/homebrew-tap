class Afslug < Formula
  desc "Rust slug generation with explicit caller configuration for path and URL path segments."
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.5.0/afslug-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "1ee3359e13edb901bfa30b407b49e27fcc9c78290bcdf348f079903a38f66c75"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.5.0/afslug-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "5053c55bc5e6deb0afd434879255229bc4a0ba65c87b18690ea389c555d3c7f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.5.0/afslug-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94d23661682dcebfa634d715d09ae66109eb2bc99b72a436d7eb26b2e0acd9c6"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
  end
end
