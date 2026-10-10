class Afpsql < Formula
  desc "Structured PostgreSQL access with explicit read and write modes"
  homepage "https://github.com/agentfirstkit/agent-first-psql"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.12.0/afpsql-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "db00e18827f4f9907eaf733c97dc7acb399ee6e1f2b1871eb46db31abd4747bf"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.12.0/afpsql-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "d195b7bc9d87695a8746914142ceac6eb7b65738d5785fe83ff04b3bbd130b1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.12.0/afpsql-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3513469938fbed841b08f1e3246eec60a96cd7ce7178c0afa4412d59bbf68b1a"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-psql/releases/download/v0.12.0/afpsql-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de9d51049b06fe76f7c18556e263809e2975642c4b2d672b69e48bee6a7ab976"
    end
  end

  def install
    bin.install "afpsql"
    bin.install "afpsql-readonly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afpsql --version")
    input = %({"code":"ping"}\n{"code":"close"}\n)
    events = pipe_output("#{bin}/afpsql --mode pipe", input, 0).lines.map { |line| JSON.parse(line) }
    assert_equal ["result", "result"], events.map { |event| event.fetch("kind") }
    assert_equal ["pong", "close"], events.map { |event| event.fetch("result").fetch("code") }
    assert_match version.to_s, shell_output("#{bin}/afpsql-readonly --version")
  end
end
