class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.1/afpsql-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "77ab9fe7abe5f2db00b6a946abe48c9e000f5d40f832c6fbeb703a898c28178c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.1/afpsql-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "64bf3c3108c92711b9a5d2d0c372f924b9bdb88241061fdaea141532807d25ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.1/afpsql-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6e076acfe8c1a53fafc9a4130efafa40fb216c5356928885e099fb14b89c45d"
    end
  end

  def install
    bin.install "afpsql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
  end
end
