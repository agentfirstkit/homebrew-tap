class Afui < Formula
  desc "Typed local interfaces for agent workflows needing human input"
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.1/afui-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "29c72c1e833b0c213f7353e5124190a2dd494f4d86baa3196daeb05a5643abde"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.1/afui-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "aa2313883ffe93603e5ca45c0466a0e3da5ab3dec00744e15597c748ce5e708f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.1/afui-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f620ab0437e699075ccc83c03c9084deb7166976124fe4038bedf0f513b73ba4"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.6.1/afui-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc6fe5e07df5d1d4db98854a78513c1b036c118314438a4e341752a76cf6a85e"
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
      event = testpath.cd do
        system bin/"afui", "frontend", "init", "inspector", "panel",
               "--scope", "workspace", "--frontend-id", "smoke"
        JSON.parse(shell_output("#{bin}/afui frontend check inspector panel --scope workspace"))
      end
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
