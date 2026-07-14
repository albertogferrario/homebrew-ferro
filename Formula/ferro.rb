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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.93/ferro-v0.2.93-aarch64-apple-darwin.tar.gz"
      sha256 "5ff3ac913c2a721d46c8b63660a72c49b46c0edbd728658e174adb9d03300ed3"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.93/ferro-v0.2.93-x86_64-apple-darwin.tar.gz"
      sha256 "9bd02a555c2bff672d4d90903408597160599b163ef794374b9b74121f5a2110"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.93/ferro-v0.2.93-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1c5a98e56b32725a4df8b0289372b8372d541ca0f4779e1608f609606293596"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.93/ferro-v0.2.93-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58a500c2e103bf2db97dcdeaa078b103ca7c07c034ca1d97167aea2eda81d372"
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
