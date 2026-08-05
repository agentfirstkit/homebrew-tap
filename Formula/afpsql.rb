class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.9.1/afpsql-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "9638bd11e3df32e239ea7b3d582d43a564739daf44d27d2cc969f98b93d2e511"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.9.1/afpsql-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "eec57bf75bbf1d8813b76d9e7c7b3a007d5d4d7c709e04ec724782698c57ab66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.9.1/afpsql-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f16c7b062786c03701f0413fb02f811f34bf56198bce69386c3a4f40d0bf0d33"
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
