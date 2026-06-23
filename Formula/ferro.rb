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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.76/ferro-v0.2.76-aarch64-apple-darwin.tar.gz"
      sha256 "c7c6078581fd4cb7186aae42a6c15bb261a5ccab10e514a23cf52f4db0d71189"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.76/ferro-v0.2.76-x86_64-apple-darwin.tar.gz"
      sha256 "47381969f6b4b01ba7b82ef5171213b7f5feaa89805934dd1a76f6b0cf5c9140"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.76/ferro-v0.2.76-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "657489697d28badff45300a1b6ce5af18d2ee299a5fb8298e812129673eeb545"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.76/ferro-v0.2.76-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1efc7656c569f50e6319f0cb944bb0812509ae2f3fa8c89ff76c97ddfc930787"
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
