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
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.71/ferro-v0.2.71-aarch64-apple-darwin.tar.gz"
      sha256 "db3b0a1b762b5cfad2401013dc256d36359d157095ebee8b12cd6cfdf64e495f"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.71/ferro-v0.2.71-x86_64-apple-darwin.tar.gz"
      sha256 "fc666ab165ebc4b8ab92912e387b6d094588911e02dba3ec8f3376912c4296c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.71/ferro-v0.2.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62c6f4e70d753040bfc5f9201f544e2d7a18375b9ddebbbe600f76cca1952556"
    end
    on_intel do
      url "https://github.com/albertogferrario/ferro/releases/download/v0.2.71/ferro-v0.2.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e50b4c49fdcfc84cf054199d7debf0ef981bf5ffb5a23a501508765a3b914870"
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
