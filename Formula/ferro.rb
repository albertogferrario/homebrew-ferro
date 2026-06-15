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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.66/ferro-v0.2.66-aarch64-apple-darwin.tar.gz"
      sha256 "d26ae8b5af17102ed31e26cd6df1154a0822074e4aa0422cd635a72e9932bfd3"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.66/ferro-v0.2.66-x86_64-apple-darwin.tar.gz"
      sha256 "84988dfa7f6740316992a0a97da04cf76f245ba3e45bf1631d327d61b32c581e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.66/ferro-v0.2.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47eb21f43ffb3184ef89324096b5012832b24d6548f186238d24daf781c0ea3b"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.66/ferro-v0.2.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "759e25e045402fcc000293871f3e103732e3167c52959a81b2d14fbd68986432"
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
