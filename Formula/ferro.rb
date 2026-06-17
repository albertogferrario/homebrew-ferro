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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.69/ferro-v0.2.69-aarch64-apple-darwin.tar.gz"
      sha256 "444d5bee234ef46f34bb0c31b79ceeddf42bbd84c7e12c7e43fae275ca7e6646"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.69/ferro-v0.2.69-x86_64-apple-darwin.tar.gz"
      sha256 "f18541629a8d3f31dfe61252cbf97f3934b3d46ec8216cdd6ff933c5edba9bc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.69/ferro-v0.2.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f09efe7ee9e26a8b1dbebfa2bf269d81c9597bb6c769dd9f9ee847aaca9c8e1f"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.69/ferro-v0.2.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dea6421d705f77236faa840eb5dc6fb7095c5dce8776dd2a2ba9986a4bb8a0f4"
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
