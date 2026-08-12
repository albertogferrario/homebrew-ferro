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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.9/ferro-v0.3.9-aarch64-apple-darwin.tar.gz"
      sha256 "151f5a8cd4506953d4a383b248f0b38d0ee27e32387254190f20f0c884c173b8"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.9/ferro-v0.3.9-x86_64-apple-darwin.tar.gz"
      sha256 "4cad2c6653bf8c2ffa4fc346d555eb12911b29bf608eb0b2f9d306cb5e8ed183"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.9/ferro-v0.3.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e44a0bde7cfa9ab62a1cb95ed54ca58c690696cdb15c7907c8613cb2c78a416"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.9/ferro-v0.3.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1316338a74a8303e3192c8a0a007bd7e1293af8074069bb0015ab04d0f002c44"
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
