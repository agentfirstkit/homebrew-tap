class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.2/afpsql-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "c126fab5dd8d717ecf42ff743916e53a9ff0d8b5d8a93ba42c01011574abf1f2"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.2/afpsql-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "c54bfeaafdadb435ad649b500c4a4daa50221ac2c0ef397b4b16e54fa454861c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.2/afpsql-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "519047d220832fb8dc8c475c427023d051e45174a5b8a90912fe027a4eb135d3"
    end
  end

  def install
    bin.install "afpsql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
  end
end
