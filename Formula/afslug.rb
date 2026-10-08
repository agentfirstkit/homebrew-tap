class Afslug < Formula
  desc "Deterministic Unicode slugs for filesystem and URL segments"
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.8.0/afslug-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "3324b76b1b283183bc58ffcfebe579c18d83896a4fc9477665604a1fca67dbaf"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.8.0/afslug-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "2f022af5860818353be85f2d12c80ac8e245e808281f8441d921c80387bd6e92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.8.0/afslug-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d9a93f0c6c4bb89ee5e7e401faee32cb1ca4d0c90db6a532c2884f23c989ae7"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.8.0/afslug-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "948aba54688f440117eb0ce3769700cf7181af758c728588a266c4cc3a6e14c8"
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
