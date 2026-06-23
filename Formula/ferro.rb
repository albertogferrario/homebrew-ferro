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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.77/ferro-v0.2.77-aarch64-apple-darwin.tar.gz"
      sha256 "aad6e1723b7d862eae18b34ae93f3b473bb32c00969eaa64d9fec87435792548"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.77/ferro-v0.2.77-x86_64-apple-darwin.tar.gz"
      sha256 "f78123245ab0a1f1e27b00529cc20716caadf29df1cc41f85866b0cca8e71db1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.77/ferro-v0.2.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "747529e545a512fffb087102bc7a7823b768dd6fcaac6f688ae39c3a91aed550"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.77/ferro-v0.2.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8115a211995943c2f55bcab7343f3b7325bd3c62cc9495c50b01793125b2324"
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
