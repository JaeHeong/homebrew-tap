class CodexRunner < Formula
  desc "Resume local Codex sessions after subscription quota resets"
  homepage "https://github.com/JaeHeong/codex-runner"
  version "0.8.1"
  license "MIT"
  depends_on macos: :sonoma

  on_arm do
    url "https://packages.jaehyeong.com/projects/codex-runner/0.8.1/codex-runner-0.8.1-macos-arm64.tar.gz"
    sha256 "9f4b0a31fa33b74692b4aaf0423e3d2ca0b9db84c37b108e715aad7e53758b17"
  end
  on_intel do
    depends_on macos: :sequoia
    url "https://packages.jaehyeong.com/projects/codex-runner/0.8.1/codex-runner-0.8.1-macos-x64.tar.gz"
    sha256 "8242076c74cf66af6a12be6d29f859c7b2f555ffdf02e854d0f9e6fb4dc94a32"
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
