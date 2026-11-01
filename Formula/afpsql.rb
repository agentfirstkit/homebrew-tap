class Afpsql < Formula
  desc "Structured PostgreSQL access with explicit read and write modes"
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.13.0/afpsql-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "95405e8ff5fb553f4605dd3e1520135bb3fc0c705a2bf0cf9834eb6b38a4c2b2"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.13.0/afpsql-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "6c99c2aad70f9c8aaf87be106467644c6e5b507bf5e7461298fb9febbbafed83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.13.0/afpsql-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58a1ff34229b063882246619a1e015e2191362baea420b8a35d8b32e5b369194"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.13.0/afpsql-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb8703a009b2a16609f6d06042997dd87c89743e532ca997826671da813c59a3"
    end
  end

  def install
    bin.install "afpsql"
    bin.install "afpsql-readonly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
    input = %({"code":"ping"}\n{"code":"close"}\n)
    events = pipe_output("#{bin}/afpsql --mode pipe", input, 0).lines.map { |line| JSON.parse(line) }
    assert_equal ["result", "result"], events.map { |event| event.fetch("kind") }
    assert_equal ["pong", "close"], events.map { |event| event.fetch("result").fetch("code") }
    assert_match version.to_s, shell_output("#{bin}/afpsql-readonly --version")
  end
end
