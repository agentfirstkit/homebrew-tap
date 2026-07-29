class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.8.2/afpsql-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "b5ca70412974650a8ef4f1bc9ffa59b2fbfd03ee68087410d08806f481ee26a2"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.8.2/afpsql-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "17670688ac929d2285e5bf3bb694043e6af9be6500fb1f90e2f2ee4cc24456b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.8.2/afpsql-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c2911fece19a9792628c13e0519c91ab6c97495ed97ff62d6cf6fcbb9931d13"
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
