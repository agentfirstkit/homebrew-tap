class Afmail < Formula
  desc "Let your AI agent work your inbox — email pulled into plain files it reads, sorts, and drafts on your machine, with nothing sent until you confirm."
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.4.0/afmail-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "33a735848d250c558dd554856ace9af62399b1b6ace8fbf008fcefe574fe6e6c"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.4.0/afmail-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "bda620e44ad533e40d750150f7cc49d70a3263cd1a456a3e9ed2f65d2289ccf6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.4.0/afmail-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b74fc936cf9d98f6f57fb6ac13e822e5911b236b7e05f001c631e4739ffcbdf6"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
  end
end
