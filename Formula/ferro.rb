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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.62/ferro-v0.2.62-aarch64-apple-darwin.tar.gz"
      sha256 "b12cc37a1b6ea5412e29b1e949d39bd1bbc85532c9fdc5e1dc7c7951a208fc60"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.62/ferro-v0.2.62-x86_64-apple-darwin.tar.gz"
      sha256 "2f5e596fc6ab55e4a1164ef6f9236b653dda8222f9ff7335b40a4f93cee1c454"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.62/ferro-v0.2.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1187cb2ce9521de2d35e8215a4005be9efb4acfaac9d8fa285a30404c34bf19"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.62/ferro-v0.2.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f9e0410f9442f91d753527f81f5129477a8d44a5ace6d35243b00f7fae55fcc"
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
