class Afpsql < Formula
  desc "A PostgreSQL interface for AI agents: reliable, structured, explicit, and read-only by default."
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.7.1/afpsql-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "7ec2d9db97525e773c6008101ea625b35d960edf747796794ebc5ee21dcce31c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.7.1/afpsql-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "ff8ca6b40f9a972ef228baeef70a085b838f5e97a0d95aac838dd6520f1b7fd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.7.1/afpsql-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38ca093cec98c525a52ea2edb9b5dac17013f2b057828eae7496163c4378e7f2"
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
