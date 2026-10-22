# Jaehyeong Homebrew tap

```sh
brew install JaeHeong/tap/codex-runner
codex-runner service install
codex-runner
```

Apple Silicon and Intel macOS builds are downloaded from
https://packages.jaehyeong.com/ with pinned SHA-256 hashes.
Codex CLI and its ChatGPT login must be installed separately.
Use `codex-runner service stop` before upgrading and `codex-runner service start`
afterward. This stops Runner while leaving managed Codex work running.

Source: https://github.com/JaeHeong/codex-runner
Existing Linux APT clients: https://apt.jaehyeong.com/ (preserved).
