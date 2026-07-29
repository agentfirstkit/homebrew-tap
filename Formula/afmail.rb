class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.8.0/afmail-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "d57d931da6d512c44735e5e14585cfcace07be1fdd06263df49f7acd931e16ff"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.8.0/afmail-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "9467abc3e3cea5120dea74afd9859d7c6925f57684015d492d90964e798c05bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.8.0/afmail-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "509cba8cefe1f771a3a6c066f29171d9b3ec7f609cd42d276bb09c4be120b362"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
