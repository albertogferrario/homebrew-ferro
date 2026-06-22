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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.75/ferro-v0.2.75-aarch64-apple-darwin.tar.gz"
      sha256 "abf6c2a4b5aed4ad58452ae3ae0cf283f044b52aa0161c0d772b5a9989b6a8b6"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.75/ferro-v0.2.75-x86_64-apple-darwin.tar.gz"
      sha256 "0fcb3680249e9c48c6633ebc51e96d6975dff18a2f1dda46c2c9fb8d701696df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.75/ferro-v0.2.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "128edcf98b91b0b4200c1b5573a45a9b43be79967141863e5bd4deec739b7feb"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.75/ferro-v0.2.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9dcfab6207cb7fb54d1ef18eadf0690de2b3d189e649fb3f4a58a33d1c3b18c8"
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
