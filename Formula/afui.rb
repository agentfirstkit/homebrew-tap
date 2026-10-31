class Afui < Formula
  desc "Typed local interfaces for agent workflows needing human input"
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.9.0/afui-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "ddd1aed5aaa55ae66eb6387975945e207aa09f571cf00f59c3fc4b0b0a499f5a"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.9.0/afui-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "31dcf06f55109ecdeeee2349377064f3ddadc5e75f9e6e1321af64bbe0f052c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.9.0/afui-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a4192f985de6e2c1022b29e0f9258e1d3170c214bddc572698677fa211845b0"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.9.0/afui-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b99547ac8a9b55268f98f27bc716220b3da6da366863dce6ed8905ae2553c24e"
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
