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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.88/ferro-v0.2.88-aarch64-apple-darwin.tar.gz"
      sha256 "25088b57ef3eb7b475814098df950b25b41f9ee1071d3fbddc8206146177557a"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.88/ferro-v0.2.88-x86_64-apple-darwin.tar.gz"
      sha256 "884b7b508311683ffbb5ade3b41ef4538b2f7a736172a1afd389839362688485"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.88/ferro-v0.2.88-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b11c00d87dc6ec647213b04a8dda9527162d795a2dac9bec92f7f7914cdded48"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.88/ferro-v0.2.88-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4377839e77c55ea0d0cf73604b1abc168c10729c4cf49369a045ecb833c305a5"
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
