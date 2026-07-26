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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.101/ferro-v0.2.101-aarch64-apple-darwin.tar.gz"
      sha256 "742c2395726e9c259fddd0bb39239542543caae609e0f21a04fecd52ee075fab"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.101/ferro-v0.2.101-x86_64-apple-darwin.tar.gz"
      sha256 "d7b5f7ad926adc6ac34669d3e043c4d49ed0551799c34ad7ceaad95d5660251e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.101/ferro-v0.2.101-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22ecb03eacda938d302392bf0e73f0e9b27472b7bed5cf4ed2fb949aca20c702"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.101/ferro-v0.2.101-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cfed8bff4622e3101a8dfed12007607daf58aeef82c9c7c8235f7d04e20ac1a"
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
