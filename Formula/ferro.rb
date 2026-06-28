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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.82/ferro-v0.2.82-aarch64-apple-darwin.tar.gz"
      sha256 "197f7c1a848d75931519b4e168ecbf4bc0420ba1e9ba45322ebdb0a402b570e6"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.82/ferro-v0.2.82-x86_64-apple-darwin.tar.gz"
      sha256 "931deb53ae022bb1eff19e1984f27e7aab9f7d0f11ba5c14ecc538ff314e7b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.82/ferro-v0.2.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9b7eecaccb5ae23d1547ffe572688fd210b22b539becad42b3a20ff2ab95646"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.82/ferro-v0.2.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bab37f1c1480e1667fffcec903dea8f131d2ab748f2499a74c9c0f077ec690c6"
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
