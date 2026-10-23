class Afui < Formula
  desc "Typed local interfaces for agent workflows needing human input"
  homepage "https://github.com/agentfirstkit/agent-first-ui"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.7.0/afui-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "e2fd2caf831d4538fe22fcf715158eb1ba076a0b909a1d21952d20e9df4281ce"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.7.0/afui-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "58e0e227de9224642b58efe5ec90b62f8c5d24f34db9eca469944e1c3e7b40d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.7.0/afui-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "013ed5e0475fd3d7dd60413946c56a121607d3bbbef986e64a167856dd517650"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-ui/releases/download/v0.7.0/afui-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d88521be202f988a2b5efad565c394c392dc2c6e6e5874f926142c740cfcace3"
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
