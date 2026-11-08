# rCommander's formula in the tap degoya/homebrew-rcommander, for Linux (RC-100-52). Rendered from
# packaging/homebrew/rcommander.rb.in in degoya/rCommander by scripts/package-managers.sh, and
# replaced by the release workflow with every release: change the template, not this file.
# macOS has the cask (Casks/rcommander.rb), since the macOS package is an app bundle.
class Rcommander < Formula
  desc "Two-panel file manager with terminals, SSH and SFTP"
  homepage "https://rcommander.net"
  version "0.21.0"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_linux do
    on_arm do
      url "https://github.com/degoya/rCommander/releases/download/v0.21.0/rcommander-0.21.0-linux-arm64.tar.gz"
      sha256 "9b2cb359133bc84ae63938a63c05967a4919c8cb7611a018f6cadff2d657c365"
    end
    on_intel do
      url "https://github.com/degoya/rCommander/releases/download/v0.21.0/rcommander-0.21.0-linux-x64.tar.gz"
      sha256 "b2ce645fe2d67fc1672381355bc1f1c8271a48af56712310394aa022c2974770"
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
