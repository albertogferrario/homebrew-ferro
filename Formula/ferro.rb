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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.84/ferro-v0.2.84-aarch64-apple-darwin.tar.gz"
      sha256 "ba67a79c5a207fe190b77c0632beefc9a68cd615b4782b8ac1836306c7f98053"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.84/ferro-v0.2.84-x86_64-apple-darwin.tar.gz"
      sha256 "e0d4036db68bad0093dd3f17e446b62ef3a192af40218c559d13e6f62d50c3fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.84/ferro-v0.2.84-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "642a290567cf1877cd2dcb16330180c5d857421ec764352cd95a2a0e4097f321"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.84/ferro-v0.2.84-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53da08aace11366e0aefd911781fc1a2dffa1416d0ac1ef734bdd99c61fbcccd"
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
