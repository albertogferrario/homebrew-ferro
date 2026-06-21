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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.72/ferro-v0.2.72-aarch64-apple-darwin.tar.gz"
      sha256 "548ed465cf9febfdb4c2c5527abd6d5d12e1e1f733ac795883c726f6d25b4d82"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.72/ferro-v0.2.72-x86_64-apple-darwin.tar.gz"
      sha256 "d4cef993de2cd1fd84d9b60f237f642e00175a2978b55b82d0a2068f7d2bd1f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.72/ferro-v0.2.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d67f74c362fc6f79297de68c17cb3dc24ce121c11e2f463f4262b5481eedd779"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.72/ferro-v0.2.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09f63ffb6c963979045850419601550bc943cb6a3476c2bbd6f287df58fa897e"
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
