class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.10.0/afpsql-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "3ed778b2c15fd9845d48a2c4e0e77dac5126f9c9cd7cd825c9211d41666f81b9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.10.0/afpsql-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "d89dedb562cd0a6dd05e3bfe2512301a4fcf7744aa05a5354b6dcbab4f4f26df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.10.0/afpsql-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03340ed4f9145a579b0421547acde62f7e2ef4cd7e2107af7cae5f1423922c6e"
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
