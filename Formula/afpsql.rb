class Afpsql < Formula
  desc "Structured PostgreSQL access with explicit read and write modes"
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.11.0/afpsql-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e31bc34d5c36d39d4d74843ee423075273ef59adff22df2172019af36e89ef9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.11.0/afpsql-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "5a07fe3900c31cb0088089d52b8439120df9b1f6507607b52889d1478de1afad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.11.0/afpsql-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a7d86fba498a9ebb1bea799b12256f0fb6917724f3804760d859e51177808a9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.11.0/afpsql-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8abe5a5a275de47e100457e413879dd9189e19a440573242457af5685f2a9f8e"
    end
  end

  def install
    bin.install "afpsql"
    bin.install "afpsql-readonly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
    assert_match "CLI reference", shell_output("#{bin}/afpsql --docs")
    assert_match version.to_s, shell_output("#{bin}/afpsql-readonly --version")
  end
end
