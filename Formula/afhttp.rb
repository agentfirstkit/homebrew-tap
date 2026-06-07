class Afhttp < Formula
  desc "Give an AI agent any URL and get back a usable page — fetched directly, or rendered in a real browser when the page needs one — with a human able to take over the same browser for a login, captcha, or 2FA."
  homepage "https://github.com/agentfirstkit/agent-first-http"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.6.0/afhttp-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "628b1104f229d0b582ee66e216784715ec7e7a315ab261cc7c20b1fa266d9b3f"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.6.0/afhttp-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "8cc28b2875f63c644965ca72e6d41e4c2376a69226db430e31de803e57fb5dbf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-http/releases/download/v0.6.0/afhttp-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49f809b563aae7ad14d4dda9ee5d31cf1c8e72edd05ef53c63771c4914fe425d"
    end
  end

  def install
    bin.install "afhttp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afhttp --version")
  end
end
