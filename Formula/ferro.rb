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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.60/ferro-v0.2.60-aarch64-apple-darwin.tar.gz"
      sha256 "f8e3c85da7a5e2da878d8ba96e95e8b74208fb94e299c34ce3c728788b9ac2d8"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.60/ferro-v0.2.60-x86_64-apple-darwin.tar.gz"
      sha256 "2a43fb456e21caa960f45f76270fba0612bfbfec7792057b24d8f8f81d7c50e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.60/ferro-v0.2.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e5400f93876dc316a014c17cc86aa89d22ade800e10ae998b66c46623fbff22"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.60/ferro-v0.2.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d746491c3d5ad0a3638888c1daf27222cd8ee93ba8caf3a72717f4d572f5f41"
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
