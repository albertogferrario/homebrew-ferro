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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.3/ferro-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "4353cec23f4fa198640e37f7dae075c774e08bb17628105e38cd59a14699c070"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.3/ferro-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "cb286a9e5597b8cb5cc2e880f7bbedec594cd77c728a2887fafc5a864375bc1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.3/ferro-v0.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a0354221dc17eadaa162d7715dbc62067ba0095f8a83398ab40b3b06ee1ef7a"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.3.3/ferro-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03004f84e1d997c794bea5da8a1f446b01196e7975398bbd7a294c0d446b38b5"
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
