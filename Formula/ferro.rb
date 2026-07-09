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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.91/ferro-v0.2.91-aarch64-apple-darwin.tar.gz"
      sha256 "a6a2a47c65188dfd2f77eec470f47775ef8d71d3afd684098dfc8da63a72b8bc"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.91/ferro-v0.2.91-x86_64-apple-darwin.tar.gz"
      sha256 "6b80f35ebef06e780860562907abd755e1c62091ea58fa62e8719e2eff531a98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.91/ferro-v0.2.91-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c62785676add8329c658cafb299c22ae4318f318618d0cfed86d655c793f252b"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.91/ferro-v0.2.91-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2e1a637056a5195e995646d126592a18b9f8a81e7a79f1fa14549c7ba2d92c1"
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
