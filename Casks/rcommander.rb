# rCommander's cask in the tap degoya/homebrew-rcommander, for macOS (RC-100-52). Rendered from
# packaging/homebrew/rcommander-cask.rb.in in degoya/rCommander by scripts/package-managers.sh as
# Casks/rcommander.rb, and replaced by the release workflow with every release: change the
# template, not this file. Linux has the formula (Formula/rcommander.rb); casks are macOS only.
cask "rcommander" do
  version "0.26.1"

  on_arm do
    url "https://github.com/degoya/rCommander/releases/download/v0.26.1/rcommander-0.26.1-macos-aarch64.zip"
    sha256 "033ba72d87e986d422e585e75aec422005de2a86437d1d168afe52886769f0bb"
  end
  on_intel do
    url "https://github.com/degoya/rCommander/releases/download/v0.26.1/rcommander-0.26.1-macos-x86_64.zip"
    sha256 "4b9893934addd68916950f716a7348d80ef0396a56eb0372da65f28b51a27bbe"
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
