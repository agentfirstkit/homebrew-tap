class Afslug < Formula
  desc "Deterministic Unicode slugs for filesystem and URL segments"
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.0/afslug-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "89418cc2b23ca6698606277633146642682bd2451c6a99a4575c71c00c3177ad"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.0/afslug-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "ad55bb9567a8995c5a50f1d214af13c650eb7d7c9006de2f7fc5aaf9927ebcc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.0/afslug-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "500c03e83688c43aa761cec3db3afec964e81863d349149b5617aff9d36536d5"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.0/afslug-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43d785a8a4aa4e482f02960ba3250a875407220332f9815bb75fe030d05281cc"
    end
  end

  def install
    bin.install "afslug"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afslug --version")
    assert_match "hello-world", shell_output("#{bin}/afslug slugify 'Hello, World!'")
  end
end
