class Afslug < Formula
  desc "Deterministic Unicode slugs for filesystem and URL segments"
  homepage "https://github.com/agentfirstkit/agent-first-slug"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.1/afslug-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "a9d58ee5e7812c64a751f59a2d5016b470ca421a35ab0f2497c4f2a1a9cad59b"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.1/afslug-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "d676ba0cbc3e91d806025711f1fa451452e781733d88abd96e23c1c93a2ca896"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.1/afslug-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "300264364889797fc19e24030eeb996343f8b8cbddbfcffaa186fc35b9d64687"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-slug/releases/download/v0.7.1/afslug-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f84c745f20c75101586cc3be06e9c0daf491455e687ca0f95e62d241f00b952"
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
