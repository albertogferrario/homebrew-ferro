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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.86/ferro-v0.2.86-aarch64-apple-darwin.tar.gz"
      sha256 "55cce0f629d826ba66ca8be4fe04302d974a9e61497d0e22d1a01ebf80e7b66d"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.86/ferro-v0.2.86-x86_64-apple-darwin.tar.gz"
      sha256 "5d251131bcd6b9883cb3d1da5acac04a022444ec53129353ee212597d6305819"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.86/ferro-v0.2.86-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ca4ff3eeed689b3f189fd8de0f0a0a32ef476ff0472de9841c7e3a9a725a2f7"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.86/ferro-v0.2.86-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83fb7fcfac983a236d315689f6bb62c3940498c0a098c267fc0fdf16542fc702"
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
