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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.96/ferro-v0.2.96-aarch64-apple-darwin.tar.gz"
      sha256 "04f8642d9ec8e602118f54f7e59eb34b1d64044494c9fffaedb9edb4c5f3c3a9"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.96/ferro-v0.2.96-x86_64-apple-darwin.tar.gz"
      sha256 "b3a29f4cae280f82f58e54ca3e6aa3c0c935b149d01403e0252f3c38674ef467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.96/ferro-v0.2.96-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c9adbdb91cee321ac1ed36afe602d31d65ac72a1aac12ddadf3d86a64d2897e"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.96/ferro-v0.2.96-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09500966daefb2ce03ef069473bc0e602a0cb03949a3bbbe77d16e53228f7373"
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
