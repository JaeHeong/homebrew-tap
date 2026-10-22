class CodexRunner < Formula
  desc "Resume local Codex sessions after subscription quota resets"
  homepage "https://github.com/JaeHeong/codex-runner"
  version "0.7.0"
  license "MIT"
  depends_on macos: :sonoma

  on_arm do
    url "https://packages.jaehyeong.com/projects/codex-runner/0.7.0/codex-runner-0.7.0-macos-arm64.tar.gz"
    sha256 "8f8ba04b3b85be8fd46aa7088a3f619c38dcb7ba327ae74f83e58a751b44a420"
  end
  on_intel do
    depends_on macos: :sequoia
    url "https://packages.jaehyeong.com/projects/codex-runner/0.7.0/codex-runner-0.7.0-macos-x64.tar.gz"
    sha256 "b9ebba9b0a1423cad55e2073a6afb2b4eb8c67713857bc2a29481f94c2d1fb4f"
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
