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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.5/ferro-v0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "95bd53c1337c28f685b8c9d72b50046984dbf4c14013fcf1195b3c1fd3febd84"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.5/ferro-v0.3.5-x86_64-apple-darwin.tar.gz"
      sha256 "1dd36c2842c13dd698f4a255a02eb74d416a6ca347d4808900c5e58dba66b168"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.5/ferro-v0.3.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a9b586c667d2025061a6047b3120dfa8b47a9a180a979e53da044527111b8b8"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.5/ferro-v0.3.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "112fb6d8214fd4a991be8a7b46bb23fe0ebf5d4c46123e06bbdef5e532ef9232"
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
