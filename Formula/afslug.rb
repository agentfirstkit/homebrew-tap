class Afslug < Formula
  desc "Deterministic Unicode slugs for filesystem and URL segments"
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.2/afslug-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "d33f7c334c6e12ff91c873a2e71af787a9ac0385d30a1927b3b8c03b202c34ca"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.2/afslug-v0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "239be66d004ae713a4d57794bd206cb55042c2e53e8b14da1d3e7c12c9a3a73d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.2/afslug-v0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c81f8075c76179867b11d150ad8b636b372ac960f3d0e560319aea4e69d77b9"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.9.2/afslug-v0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf30315c32aa3aaf4d4180c793838a521364244266d2d681124cae31107ef2f7"
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
