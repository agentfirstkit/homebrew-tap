class Afhttp < Formula
  desc "Private browser automation with explicit profiles and takeover"
  homepage "https://github.com/agentfirstkit/agent-first-http"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.15.0/afhttp-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "36690b8835692cbef55ef19d3aae8e6f407eb382dd9847087d68e49969412766"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.15.0/afhttp-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "180fd8daa2a428be7c865de924706b62e01ff0f6dff877dbb289a0e1a17dab62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.15.0/afhttp-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "035c5360e6123b72f8809ae572e1d87e210fe05434e6482fe4923f5ae5ef3f20"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.15.0/afhttp-v0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97a0060a40cb550ab56f0dada956bfb2c16174e5349e49f6f33f720a42fd3e60"
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
