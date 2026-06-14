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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.61/ferro-v0.2.61-aarch64-apple-darwin.tar.gz"
      sha256 "4ee292ce40edcc4a39472dc84f9391767fde105d817051983d38eb952cf29beb"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.61/ferro-v0.2.61-x86_64-apple-darwin.tar.gz"
      sha256 "239a2a46036d65042d843fca4878c25e42ee3f834b23d5f3ce7bfaea1856945e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.61/ferro-v0.2.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "911771a83641e5e4fd91166b9a20cd5b7cf9d95704d4aef8eb6481ae046e9cb3"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.61/ferro-v0.2.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b76fd2fe918ed3d118ea7334eae9460a0bd81d5fe09d95cfa651a16ca3b912c"
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
