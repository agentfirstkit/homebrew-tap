class Afui < Formula
  desc "Typed local interfaces for agent workflows needing human input"
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.8.0/afui-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "f18b142b5e2cfdaf391d09a078beffc992930f50deee8069647c09e7f724d42c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.8.0/afui-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "dd60bf476bca0536e6b5f1fcdb160fd4d13e542dd0a339ee05dcb5f5297da5dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.8.0/afui-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76f03c8eb2d032499eeba93f019c443a632827453bd842f79bc67c31c62986f3"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.8.0/afui-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68224aa31c1b89baa8d4c91dd6833d7c0925d5b04ea82eb9f09ba9e02a0b8383"
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
