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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.80/ferro-v0.2.80-aarch64-apple-darwin.tar.gz"
      sha256 "1ddeba9759a4f93d6f706d719ecb3d3f61a8c9890cec834e5b86ce0e77eee023"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.80/ferro-v0.2.80-x86_64-apple-darwin.tar.gz"
      sha256 "7dccd19009d6bf3efccd10d14320b36f192efaecbf1ea268c28609e40897a65e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.80/ferro-v0.2.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fdecec157b80b76906eb0d4b4fa0b7f6f68e6c59265a36a5bf382e4b5e54051"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.80/ferro-v0.2.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad4c7c9ccea8685033de67d600e74eef69db924bb6016ca22108571cb6a98642"
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
