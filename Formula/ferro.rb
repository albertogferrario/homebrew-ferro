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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.100/ferro-v0.2.100-aarch64-apple-darwin.tar.gz"
      sha256 "410696412a32b30170acb135c0891e62de5ea7cc817c1ec5c6d4d752f87cef97"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.100/ferro-v0.2.100-x86_64-apple-darwin.tar.gz"
      sha256 "4eaac484e16ac8adc4ba97f24948c67c08231a4d60d094489da37fa6094dcdf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.100/ferro-v0.2.100-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e8948dceb4e6ec3a0728320fdcaf2294909907dca4cda3e58b596cc80688af8"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.100/ferro-v0.2.100-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "719cf5bc29a2e3b850e8541431c0507fb9a96261d6c3d8150386419e4367166f"
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
