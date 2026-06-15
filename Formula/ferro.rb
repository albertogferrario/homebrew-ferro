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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.65/ferro-v0.2.65-aarch64-apple-darwin.tar.gz"
      sha256 "1bcc4350a76f361fa426db4dee83e8104cf6d1849949a9feff17828352cbcd3b"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.65/ferro-v0.2.65-x86_64-apple-darwin.tar.gz"
      sha256 "1bb506f6e8dd649e78bea6269cb5b139af5787b3b83b55123daddc9064fe8461"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.65/ferro-v0.2.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9044c88a9cf50cb74ee347e48b8b6b80c9c7316727631675cba68fae9bde70b3"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.65/ferro-v0.2.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2906a8632d19ad5554fff78d9f9490743a8cfb071f28ce1c275bd3ace217f627"
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
