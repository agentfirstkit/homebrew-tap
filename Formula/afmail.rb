class Afmail < Formula
  desc "Local-first inbox triage, drafting, review, and delivery"
  homepage "https://github.com/agentfirstkit/agent-first-mail"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.12.0/afmail-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "fde38183310516590d7e70b62d6f8cd39983822129cbeed64e401f4dca7c42f0"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.12.0/afmail-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "d84ae5943014cc606973c9354e232089b0050a4659e7f0f57c138281cf5ae094"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.12.0/afmail-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4d5f32122222acd61cb6e098b7403b7135093eef6611a1cf0312d4e1433fc07"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-mail/releases/download/v0.12.0/afmail-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71571fd316114a8717131b463ec2ed26aa6bb28ebc0fdda5f0cc19d9da8a7780"
    end
  end

  def install
    bin.install "afmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afmail --version")
    testpath.cd do
      system bin/"afmail", "init", "mail"
      system bin/"afmail", "doctor", "--workspace", "mail"
    end
  end
end
