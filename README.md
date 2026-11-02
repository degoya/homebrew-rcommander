# rCommander for Homebrew

The Homebrew tap of [rCommander](https://rcommander.net), a two-panel file manager with
terminals, SSH and SFTP: a cask for macOS (Apple Silicon and Intel) and a formula for Linux
(x86-64 and arm64).

```bash
# macOS
brew install --cask degoya/rcommander/rcommander
# Linux
brew install degoya/rcommander/rcommander
```

`brew upgrade rcommander` brings the next release; rCommander installed through Homebrew does not
replace itself, and its update window shows that command. The macOS app is signed ad hoc, not
notarised: macOS asks once before its first start. Linux needs glibc 2.39 or newer.

Current version: 0.16.1. The cask and the formula are written by the release workflow of
[degoya/rCommander](https://github.com/degoya/rCommander) with every release - issues and changes go there,
not here. The handbook's installation page:
<https://github.com/degoya/rCommander/wiki/installation>.
