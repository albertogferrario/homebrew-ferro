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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.68/ferro-v0.2.68-aarch64-apple-darwin.tar.gz"
      sha256 "47408649ef8f490a3a61f341c1a75001ef839a69e5a58cd69d6a26d22d7f9ed1"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.68/ferro-v0.2.68-x86_64-apple-darwin.tar.gz"
      sha256 "9e97be4d7292f17d43cf86a678bb222bffe1a920d1669a94d6636541213a26bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.68/ferro-v0.2.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e517282e015bfcb0ef12d3c363c6e8fb8e8b060d34a6e30e3090f4d6d9bf3743"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.68/ferro-v0.2.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64e698891d2973137fc361aa298c028873b3049dab21cad2fde246f0a44003f4"
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
