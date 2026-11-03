class Loct < Formula
  desc "Fast, language-aware codebase analyzer for AI agents"
  homepage "https://loct.io"
  license "BUSL-1.1"

  # 0.15.1 is not on GitHub Releases (those stop at v0.14.5). The installer
  # and loctree.com publish one combined bundle per target; this formula
  # still installs only the loct CLI from that bundle.
  on_macos do
    on_arm do
      url "https://loctree.com/releases/0.15.1/loctree-0.15.1-gc56718c7930a-aarch64-apple-darwin.tar.gz"
      sha256 "1b8f346de5063df0d9d01104b1ae7e15277c040b965f0fe5919b5f35c0f19e2c"
    end

    on_intel do
      url "https://loctree.com/releases/0.15.1/loctree-0.15.1-gc56718c7930a-x86_64-apple-darwin.tar.gz"
      sha256 "b2ebeafd4ed280b8347529bfa3630e2947cdb6ba956dc98205546dac19bd8193"
    end
  end

  on_linux do
    on_intel do
      url "https://loctree.com/releases/0.15.1/loctree-0.15.1-gc56718c7930a-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c059e60cd41acb273a608cfe62bf8f4acd14c57d84fe31a89cf1e6facacfeaf8"
    end
  end

  def install
    bin.install "bin/loct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/loct --version")

    (testpath/"test.js").write("export const answer = 42;\n")
    output = shell_output("#{bin}/loct #{testpath}")
    assert_match "test.js", output
  end
end
