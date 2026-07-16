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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.94/ferro-v0.2.94-aarch64-apple-darwin.tar.gz"
      sha256 "03f0aa83fc810c470324049bea0ee271cde7acf3eda5101787b8c360ae02b475"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.94/ferro-v0.2.94-x86_64-apple-darwin.tar.gz"
      sha256 "85b6dee797dc6adbfe08b55d207fb5e098290ccc7b4f79d69d02661e14d2b695"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.94/ferro-v0.2.94-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1bfecee738b6fa0c432e8e3a3f0db8a4f80b562b5b6a1ab6fe43850f8c36d0d3"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.94/ferro-v0.2.94-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e20aff1730b0651b8a4a7f375c6d29b4b37f723ff68017d47065533dde3467af"
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
