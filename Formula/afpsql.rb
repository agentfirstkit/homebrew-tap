class Afpsql < Formula
  desc "A PostgreSQL tool for AI agents — SQL in, typed rows out, on a connection that stays open."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.5.0/afpsql-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f4cdff15a4b656ac2fcc7f2a477565ee22e0c12cdc06166448fa03ad44236ed"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.5.0/afpsql-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "5802f9b7b70ea3617f0c281a74d82a40ead04edb16bfbab42a71ebcd4f6f0fd1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.5.0/afpsql-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47f303f6c1eb4708ede34b1044bb4e4570598b2a3f34e19bb1fcd70be02a1a54"
    end
  end

  def install
    bin.install "afpsql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
  end
end
