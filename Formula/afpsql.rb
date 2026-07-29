class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.8.1/afpsql-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "b4e202c6a944295e93f6512ef7dec6af596a20b6794cb553611b925c949bf443"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.8.1/afpsql-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "13f95bff5c8fc308eec11a3cb99d4b04a66706c9fdc9b0c085ac28eb72f0fa31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.8.1/afpsql-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a8ba1c6ab01341c5e843ea569f10e8c6ee52358709158515283635e189f8110"
    end
  end

  def install
    bin.install "afpsql"
    bin.install "afpsql-readonly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
    assert_match version.to_s, shell_output("#{bin}/afpsql-readonly --version")
  end
end
