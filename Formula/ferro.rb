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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.0/ferro-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "b7bcd61e34714d488d798b9d879d2e3d8a797ce9e3c0a7fe4f9137ea1addebe0"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.0/ferro-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "35d00be1b231a59a684afd3fa367b1080fd7f3821cd1d36e258d4b5f09c069ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.0/ferro-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21936bc21492e974e1a64e2c00e7e031408eaf48202d0d5094958f83d280d2d8"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.0/ferro-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98540ef7ada4f86902dad88c64a86ea27102960fddb950d4e756760316606e7b"
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
