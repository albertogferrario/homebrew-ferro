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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.63/ferro-v0.2.63-aarch64-apple-darwin.tar.gz"
      sha256 "ab7c9e181ec65eb40ca90dcbaa117e9078f1a3405062948cd71595c8c94506aa"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.63/ferro-v0.2.63-x86_64-apple-darwin.tar.gz"
      sha256 "9840f2d8eb8ba4ae6f53cbbd1f6e04db4cde0e0f1da7e7d4887ac41b0d5535c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.63/ferro-v0.2.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5527b62f6b84bdbcacbbf24e676b7659dfb995741afc3a6058c16ac6d42f0475"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.63/ferro-v0.2.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc2c5b05e20d465b21f181a295516501d8f4e20a8f5972f600930b95f34ccc99"
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
