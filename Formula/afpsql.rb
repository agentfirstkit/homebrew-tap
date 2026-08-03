class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.9.0/afpsql-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "121b6e06cf58cc18e9a2a0c6be47d32bdbbde9b29b0f7a9159e2c64f0855555d"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.9.0/afpsql-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "44b375d83a9d4892fbe927aa46ce777cc79ca5f99b3d1bb9797f87eed94b94d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.9.0/afpsql-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a80e5e11a7cf285ad714ee545d4eb2908e89e68f7deeaf660a65821da975ad0"
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
