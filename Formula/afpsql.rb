class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and safe by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.0/afpsql-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "383c53da68b0291518bcef48e12781c48ed408019c08aa7ab3e8c7aa63f11281"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.0/afpsql-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "f4a075c5a8130c61981a2ebbd3bfd8f379f03b0b09b2b0e0673f79bd72f871b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.0/afpsql-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfea06ca9ea549a6fe653c05c0f84d44d072289e35a6ea147633be5ff22dcc3c"
    end
  end

  def install
    bin.install "afpsql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
  end
end
