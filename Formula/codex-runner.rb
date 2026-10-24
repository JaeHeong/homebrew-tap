class CodexRunner < Formula
  desc "Resume local Codex sessions after subscription quota resets"
  homepage "https://github.com/JaeHeong/codex-runner"
  version "0.8.0"
  license "MIT"
  depends_on macos: :sonoma

  on_arm do
    url "https://packages.jaehyeong.com/projects/codex-runner/0.8.0/codex-runner-0.8.0-macos-arm64.tar.gz"
    sha256 "3a0de68120cc34121765b2e3109b5b0ab5b448314de15c0a62bcdb8e072c009e"
  end
  on_intel do
    depends_on macos: :sequoia
    url "https://packages.jaehyeong.com/projects/codex-runner/0.8.0/codex-runner-0.8.0-macos-x64.tar.gz"
    sha256 "f10bdecd296b5b3743e5fa5939ee4c1e31bf5e92655327fc50a94342ec83d09f"
  end

  def install
    bin.install "codex-runner"
    pkgshare.install "licenses", "THIRD_PARTY_NOTICES.txt", "LICENSE"
  end

  def caveats
    <<~EOS
      Install Codex CLI and log in with your ChatGPT account separately.
      To start the per-user background service: codex-runner service install
      Open the session menu with: codex-runner
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex-runner --version")
  end
end
