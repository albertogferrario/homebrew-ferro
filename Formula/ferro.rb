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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.90/ferro-v0.2.90-aarch64-apple-darwin.tar.gz"
      sha256 "5d889b4192793739cdfce5a5c39c5fe9d105ec12dd7d9bbeca6eede610de6d25"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.90/ferro-v0.2.90-x86_64-apple-darwin.tar.gz"
      sha256 "13561784c30b7987db3408660a581e4cdb4352f8cf24c44e999f0344e3b74c3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.90/ferro-v0.2.90-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6079bdb4e4a6b0acd43a170ebe37b99192659190ab374fadc44680445e1b0897"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.90/ferro-v0.2.90-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf843cac8927ab90951566c55fbd5dd1245e7514c563d99f435495d9a88a697e"
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
