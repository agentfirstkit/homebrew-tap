class Afmail < Formula
  desc "Local-first inbox triage, drafting, review, and delivery"
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.13.0/afmail-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "0ed6fbeeb2387e53e8f6e1217f0665d8b5420f6023e4f1fb5d913abb6657e944"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.13.0/afmail-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "71fc547224bf19a3cb1da00b13e3cbd3b4c541fc5b369ba4379e22c93a2c1d7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.13.0/afmail-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "165b1e93959445fc08f39cd83804f7b6917e9e7ba63cfc37ab0bca4236328fea"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.13.0/afmail-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e7af63d0748791cacb024b72d3ab2f155560e12098ae987f0eda088f5c4d522"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
    testpath.cd do
      system bin/"afmail", "init", "mail"
      doctor = shell_output("#{bin}/afmail doctor --workspace mail 2>&1", 3)
      assert_match "\"issue_count\":1", doctor
      assert_match "no_mail_source", doctor
    end
  end
end
