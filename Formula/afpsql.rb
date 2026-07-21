class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.7.2/afpsql-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "0a7b9e5e0ba2d263c596ff916c91a0a87fe6fa8d1f8fd8d0ce71626e394c50e5"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.7.2/afpsql-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "66087df9f494253983f122fff3ddf5ef19fb870dcc89fed28f7e77d3b86141e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.7.2/afpsql-v0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18227f505e25dbeeff7f75775abc7f4498a13c5cf35def9ae206aa8434c30832"
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
