class Afslug < Formula
  desc "Rust slug generation with explicit caller configuration for path and URL path segments."
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.2/afslug-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "127f4b007f7be3011dc106f971c41050e27ff3bf2b55c7f999b52a920ce0a9f9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.2/afslug-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "d7051b2b287af9ab178c237b4e3ba49d8630f1759d4483186657fc3ce7fbcd11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.6.2/afslug-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd306a701242ef077f3dd1cbea8eac5c08804877b92a1920a9cb1913377c5b97"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
  end
end
