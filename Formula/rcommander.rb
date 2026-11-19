# rCommander's formula in the tap degoya/homebrew-rcommander, for Linux (RC-100-52). Rendered from
# packaging/homebrew/rcommander.rb.in in degoya/rCommander by scripts/package-managers.sh, and
# replaced by the release workflow with every release: change the template, not this file.
# macOS has the cask (Casks/rcommander.rb), since the macOS package is an app bundle.
class Rcommander < Formula
  desc "Two-panel file manager with terminals, SSH and SFTP"
  homepage "https://rcommander.net"
  version "0.23.3"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_linux do
    on_arm do
      url "https://github.com/degoya/rCommander/releases/download/v0.23.3/rcommander-0.23.3-linux-arm64.tar.gz"
      sha256 "77ec370337da584a965d7c4e11f45e67f46bb809177c4bba179f1247fc49e980"
    end
    on_intel do
      url "https://github.com/degoya/rCommander/releases/download/v0.23.3/rcommander-0.23.3-linux-x64.tar.gz"
      sha256 "9db06a3502becf2b9e8b5d1f4482a201c90d9c2fbe93d7c4874fd6bb0e0c6ee5"
    end
  end

  depends_on :linux

  def install
    # The archive stays together in libexec: rCommander installs its bundled plugins from
    # plugins/ beside the executable. bin/ gets a script that execs the real file, so the program
    # runs from the Cellar, where its update check sees that Homebrew updates it.
    libexec.install "rcommander", "plugins", "VERSION.txt"
    doc.install "README.md", "LICENSE", "NOTICE"
    bin.write_exec_script libexec/"rcommander"
  end

  def caveats
    <<~EOS
      rCommander is a desktop program: start it from a graphical session with `rcommander`.
      It needs glibc 2.39 or newer (`ldd --version`) and the system's X11 or Wayland libraries.
      Update it with `brew upgrade rcommander`; it does not replace itself.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rcommander --version")
  end
end
