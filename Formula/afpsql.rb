class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.3/afpsql-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "540e6bdc033b1f62bb5ce9a32659ad9e1e8866557d971f77e41bfda8102d5c04"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.3/afpsql-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "edc3887e776cdc6f8b81a41dfb77cf05c12cf30fdf6b577948fac9cff424ed15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.6.3/afpsql-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d89363a5b5636d71ffe3dd7ad1741ddce31b72b0b56172c1d2d89d72b9d0f156"
    end
  end

  def install
    bin.install "afpsql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
  end
end
