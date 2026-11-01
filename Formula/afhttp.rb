class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.0/afhttp-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "f6bcbf5cf3fa968d014f3bcda4122a87aa45876e9abcbe601e7cb6f4462bafe0"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.0/afhttp-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "f6f052c7c1b36302e5b02e608083d2cd819c51fbabd3b428b374fe9f43cfae6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.0/afhttp-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "893a87002ffa67de3328b0570c85469e88ce7bf388a4442b85c015ff72284893"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.16.0/afhttp-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c62d3de209b4ab383b7bdde2609772f0191e381cc90d2559299cd22056eafcc8"
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
