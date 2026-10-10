class Afterminal < Formula
  desc "A live terminal an agent drives and a person can take over"
  homepage "https://github.com/agentfirstkit/agent-first-terminal"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.3.0/afterminal-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "50da3f7ab35e5ed8ebe153ee503c04ef5b62cf952c7b33414621c56d3dadbe67"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.3.0/afterminal-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "539ea0ad8688369e1220281b1675c750cc5bf913bdca0d751ec05aafb6c9a1e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.3.0/afterminal-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10ccbd86baddb9db01cc0a9dec64dad089d5ab5f9593ab2ff6986843c7666688"
    end
    on_intel do
      url "https://github.com/agentfirstkit/agent-first-terminal/releases/download/v0.3.0/afterminal-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "626fa52751dc61d48d9955f016656ebf9cddc485b9b6e3c60cabb9f5a82f128d"
    end
  end

  def install
    bin.install "afterminal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afterminal --version")
    system bin/"afterminal", "api", "export", "--directory", testpath/"contract"
    contract = JSON.parse((testpath/"contract/openapi.json").read)
    assert contract.fetch("paths").fetch("/v1/sessions").key?("post")
  end
end
