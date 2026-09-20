class Loct < Formula
  desc "Fast, language-aware codebase analyzer for AI agents"
  homepage "https://loct.io"
  version "0.14.5"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/Loctree/loct/releases/download/v0.14.5/loct-darwin-aarch64.tar.gz"
      sha256 "67225387843076a40e898abd598aae48719037a4743071ea0cf4412ad5a1d5a1"
    end

    on_intel do
      url "https://github.com/Loctree/loct/releases/download/v0.14.5/loct-darwin-x86_64.tar.gz"
      sha256 "9b64c5eeb0781f76b27e90ecc69b56963ae85eed8a7272425dbf06646e566da7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Loctree/loct/releases/download/v0.14.5/loct-linux-x86_64.tar.gz"
      sha256 "2e1c83e7bc28fa391fd891e8853491031d05b47ea1a51cbb6e650cda2dbdfbb5"
    end
  end

  def install
    bin.install "loct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/loct --version")

    (testpath/"test.js").write("export const answer = 42;\n")
    output = shell_output("#{bin}/loct #{testpath}")
    assert_match "test.js", output
  end
end
