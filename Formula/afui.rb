class Afui < Formula
  desc "Typed local interfaces for agent workflows needing human input"
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.0/afui-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "f2e3f7e83853c44b6be89b034b89e2e57a884b43572fc138a6ee9d1003769a4e"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.0/afui-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "ae4a001979579ed7187ad49984b8540780c742b407f9f6df776f2c82a5dbf986"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.0/afui-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "208f0ac6d59dc1dffd70ff38a91fa563b5a643cf8be13b11be8fec286c3758ce"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.0/afui-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a451c57239a4fd6c4414f875fc381f31ca96b3384a04897b2d2468ff250af2df"
    end
  end

  def install
    bin.install "afui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afui --version")
    previous_config = ENV["AFUI_CONFIG_DIR"]
    previous_safe_mode = ENV["AFUI_SAFE_MODE"]
    ENV["AFUI_CONFIG_DIR"] = (testpath/"afui-config").to_s
    ENV["AFUI_SAFE_MODE"] = "0"
    begin
      testpath.cd do
        system bin/"afui", "frontend", "init", "inspector", "panel",
               "--scope", "workspace", "--frontend-id", "smoke"
        system bin/"afui", "frontend", "check", "inspector", "panel",
               "--scope", "workspace", "--stdout-file", testpath/"frontend-check.json"
      end
      event = JSON.parse((testpath/"frontend-check.json").read)
      assert_equal "result", event.fetch("kind")
      assert_equal "frontend_check", event.fetch("result").fetch("code")
      assert_equal "smoke", event.fetch("result").fetch("frontend_id")
      assert_equal "disabled", event.fetch("result").fetch("status")
      manifest = JSON.parse((testpath/".afui/frontends/inspector/panel/frontend.json").read)
      assert_equal "smoke", manifest.fetch("frontend_id")
      assert_equal "1", manifest.fetch("ui_api_version")
    ensure
      ENV["AFUI_CONFIG_DIR"] = previous_config
      ENV["AFUI_SAFE_MODE"] = previous_safe_mode
    end
  end
end
