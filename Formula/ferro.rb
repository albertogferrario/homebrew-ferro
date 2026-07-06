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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.89/ferro-v0.2.89-aarch64-apple-darwin.tar.gz"
      sha256 "5eec1a666992298019c78d3b38455607e386ac71e7a31cd962b1a92aeb2b0acc"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.89/ferro-v0.2.89-x86_64-apple-darwin.tar.gz"
      sha256 "240e45127627d5757b6886f09ae7e6638ba7b66d4d66b4893850af28111c9069"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.89/ferro-v0.2.89-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b76219f93b9c9df1968d322a410260aedd3c15afb1a05fe3b31305920853a3f"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.89/ferro-v0.2.89-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce25621b1acd99f944dc822d5c61089c598da07b2103249895b337c17c0d40e6"
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
