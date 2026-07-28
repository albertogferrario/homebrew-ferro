# Source: pattern from shopify/homebrew-shopify/ejson.rb (verified, Homebrew 6.x)
#         + docs.brew.sh/Formula-Cookbook
class Ferro < Formula
  desc "CLI for scaffolding Ferro web applications"
  homepage "https://github.com/albertogferrario/ferro"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.6/ferro-v0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "1e308a475981387da4421cb0df1b1dd432153ac2764bb5ce91b52bcc3382dd0b"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.6/ferro-v0.3.6-x86_64-apple-darwin.tar.gz"
      sha256 "cde816b2a4e2526eb3c8c8802d1bc8703b8f383d6b1269abd1fa6d073200e649"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.6/ferro-v0.3.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7efe0e57954c6fde35fd8f1ed4365f33b3e8bc642fee6ca9578cf3b6c45646c"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.6/ferro-v0.3.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7e9fd148fe2e9fde4b0c4444bccc61c6af71af78529728e3a99b974194f7697"
    end
  end

  def install
    bin.install "ferro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ferro --version")
    system bin/"ferro", "new", "smoke-app", "--no-interaction", "--no-git",
           chdir: testpath
    assert_path_exists testpath/"smoke-app"
  end
end
