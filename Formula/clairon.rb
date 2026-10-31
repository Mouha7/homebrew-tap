# La formule n'installe que les sources ; `clairon install` construit
# l'application SUR LA MACHINE, ce qui évite la notarisation par Apple.
class Clairon < Formula
  desc "Polished notifications for coding agents (Claude Code first)"
  homepage "https://github.com/Mouha7/clairon"
  url "https://github.com/Mouha7/clairon/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c9c36aad4ab8fdcc7abe31d157ede03bee8d0f032a33cfd043f89b425701fc2f"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/clairon"
  end

  def caveats
    <<~EOS
      Pour construire l'application et brancher les hooks de Claude Code :
        clairon install
      Après une mise à jour, relancer `clairon install` reconstruit l'application
      (les hooks, eux, visent opt/clairon et suivent d'eux-mêmes).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clairon --version")
  end
end
