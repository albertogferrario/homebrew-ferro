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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.7/ferro-v0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "3aa04e425770bbe80c67c197fd0c14101bbbe518f674ab7be0413f48b87fce63"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.7/ferro-v0.3.7-x86_64-apple-darwin.tar.gz"
      sha256 "04619974204dd4039d0b21a1c0563dc2c55e165767acb15d3d763d456beaf285"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.7/ferro-v0.3.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e259a0242761df34e977be552fc4e8f2fc847726da240f39fcffe9db9750cc55"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.7/ferro-v0.3.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9bbf09b0fed78c6095c1ca1ef72bfbef558ab3b0574810a7a7302588a13a165"
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
