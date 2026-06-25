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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.81/ferro-v0.2.81-aarch64-apple-darwin.tar.gz"
      sha256 "b318d31e381c1b0a9ccc824e3aff5376b8bd640279c7e1c59f94f529e625467b"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.81/ferro-v0.2.81-x86_64-apple-darwin.tar.gz"
      sha256 "1c1bb3aa94148dcefd0a57df2b1202c79f3800094e30c776bde595ea1e2505c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.81/ferro-v0.2.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d1dba62f477a324334779d2000238f04472100f02e231795516d642008fbee6"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.81/ferro-v0.2.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4cc597529e11ef92dba493f4946e82dc2cd6c2746a18b9fb57770384b7d678a"
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
