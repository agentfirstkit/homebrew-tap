class Afhttp < Formula
  desc "Persistent HTTP client for AI agents — one request, one JSON line"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.4.3/afhttp-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "e5bdf48aafb34ea0b85ffb3d95cce95184191eed239675d3b8b49a788bd5b174"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.4.3/afhttp-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "b1fcbc4e6b7ff79d5553fc00049b162c90c602da23559d0395d93feed41d275c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.4.3/afhttp-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d4af00a3073a1e7565573d4260dfd2726f5c3aff455f98b6a79a888568102f9"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
