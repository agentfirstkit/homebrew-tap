class Affiles < Formula
  desc "One directory, read-only, in front of a person who is elsewhere"
  homepage "https://github.com/agentfirstkit/agent-first-files"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.2.0/affiles-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "35038b9c782e23b26f64fde0022434e24bc29d4f997b15a77605c36e0a931dcd"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.2.0/affiles-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e9c1d8820dcd97bc22525b5ec281dc6f23e3b39bf15ee5460f4e1aaa5b3b44c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.2.0/affiles-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06f1afc1a4232dbfcefc35d26d196a6c564fb0b87acf00cf87e1d2211ccd5da1"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-files/releases/download/v0.2.0/affiles-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a221269c481fe0791dd8836aec4fdb3acf33ff5cce84ea9486f23c5a20abc86c"
    end
  end

  def install
    bin.install "affiles"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/affiles --version")
    system bin/"affiles", "api", "export", "--directory", testpath/"contract"
    contract = JSON.parse((testpath/"contract/openapi.json").read)
    assert contract.fetch("paths").fetch("/v1/directories").key?("get")
    assert contract.fetch("paths").fetch("/v1/files/text").key?("get")
  end
end
