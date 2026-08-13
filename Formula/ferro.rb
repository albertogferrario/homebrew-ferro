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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.10/ferro-v0.3.10-aarch64-apple-darwin.tar.gz"
      sha256 "4ffa60b62ba286ec03fe7353cc113645f8af1b2b1c2d927b1057917c3805c50e"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.10/ferro-v0.3.10-x86_64-apple-darwin.tar.gz"
      sha256 "d5404a55f1c0a6fe841d39bea2c0f9f1f9945ad4bf76ffd5da1c961677a0bb52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.10/ferro-v0.3.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f43469a209014dec195d60eaa7258d287ea04475a5f2762a2699b02699b149e5"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.10/ferro-v0.3.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40b1685591e3b89cc67841baf8253d7e188fa4100541a3bd8c8515329a31d667"
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
