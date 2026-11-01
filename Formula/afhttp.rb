class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.1/afhttp-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "890ed95100bfe5941b1a0d6208f380816037457dd8a7127b94e843c046209915"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.1/afhttp-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "e5170a01aff6b91769788e4d01ce57537fda429933a1c1ef9d3c6f92a0374df9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.1/afhttp-v0.16.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d3b60f6b24b4bc9a28ae4b489043ce3ad1b7f4a0f30793f10ffd6947e3d9f39"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.1/afhttp-v0.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6545a96c525a3dfa581c0aabb125887b23f56cd20bdf3fd4acddb2c80a5568f"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
    (testpath/"profiles/chromium/inspector").mkpath
    (testpath/"profiles/chromium/inspector/fixture.txt").write("profile smoke\n")
    system bin/"afhttp", "profile", "list", "--profile-root", testpath/"profiles",
           "--stdout-file", testpath/"profiles.json"
    event = JSON.parse((testpath/"profiles.json").read)
    assert_equal "result", event.fetch("kind")
    assert_equal "profile_list", event.fetch("result").fetch("code")
    profiles = event.fetch("result").fetch("profiles")
    assert_equal 1, profiles.length
    assert_equal "chromium", profiles.first.fetch("backend")
    assert_equal "inspector", profiles.first.fetch("name")
  end
end
