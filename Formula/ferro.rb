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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.92/ferro-v0.2.92-aarch64-apple-darwin.tar.gz"
      sha256 "dac05a8710e5c8bbcff95e19e5d58f9111e8845ee0d32827e7a90b42de57db5e"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.92/ferro-v0.2.92-x86_64-apple-darwin.tar.gz"
      sha256 "8666dd0b507cfd8ee8224cf66ef1ddb47b03a82fec4e849193d5c5b8a32043df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.92/ferro-v0.2.92-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13e0191e53e263a6a4ab67b3ea2e094bea3a5876cf98088d58a539c961ef5f2a"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.92/ferro-v0.2.92-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0abc4687f4840d20c9e116350da812aa0fe198dbd1f547db5f0b8c2c95d487a"
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
