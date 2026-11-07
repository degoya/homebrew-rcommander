# rCommander's cask in the tap degoya/homebrew-rcommander, for macOS (RC-100-52). Rendered from
# packaging/homebrew/rcommander-cask.rb.in in degoya/rCommander by scripts/package-managers.sh as
# Casks/rcommander.rb, and replaced by the release workflow with every release: change the
# template, not this file. Linux has the formula (Formula/rcommander.rb); casks are macOS only.
cask "rcommander" do
  version "0.20.0"

  on_arm do
    url "https://github.com/degoya/rCommander/releases/download/v0.20.0/rcommander-0.20.0-macos-aarch64.zip"
    sha256 "395c37215887206675cf82c8bf728a49c8f5dfedeff3290e95320385ffd7f3aa"
  end
  on_intel do
    url "https://github.com/degoya/rCommander/releases/download/v0.20.0/rcommander-0.20.0-macos-x86_64.zip"
    sha256 "8147d4702d02655d8ccf1362699fd2e712c6dfee8b2c334cfc3f0fc3e58ab15e"
  end

  name "rCommander"
  desc "Two-panel file manager with terminals, SSH and SFTP"
  homepage "https://rcommander.net"

  livecheck do
    url "https://github.com/degoya/rCommander"
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "rCommander.app"
  binary "#{appdir}/rCommander.app/Contents/MacOS/rcommander"

  zap trash: [
    "~/Library/Application Support/de.degoya.rCommander",
    "~/Library/Caches/de.degoya.rCommander",
    "~/Library/Preferences/de.degoya.rCommander",
  ]

  caveats <<~EOS
    rCommander is signed ad hoc, not notarised. On its first start macOS asks whether to open
    it: open rCommander once with a right-click and Open, or allow it under System Settings,
    Privacy & Security, Open Anyway. The handbook's installation page shows the steps:
      https://github.com/degoya/rCommander/wiki/installation

    Update it with `brew upgrade rcommander`; it does not replace itself.
  EOS
end
