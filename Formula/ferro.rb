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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.74/ferro-v0.2.74-aarch64-apple-darwin.tar.gz"
      sha256 "404e59ecae41b934e0fd51c0aae922eb9c1273a33cb5125ee149fb77a790af20"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.74/ferro-v0.2.74-x86_64-apple-darwin.tar.gz"
      sha256 "b36966f656f1a3c62a086707aa68fa93e63ab908b698fc6db465493d35d070b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.74/ferro-v0.2.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d07fbb3ca7ef3f6d67524f62e4462aa969a645d0b9e33e4cb18ff7f73839cfe"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.74/ferro-v0.2.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "72cff6a3579311799767143b4d59d4531712be6ad0e50eeccd77ed6e975df762"
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
