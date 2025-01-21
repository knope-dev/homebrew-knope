class Knope < Formula
  desc "Automate developer tasks, like generating changelogs and updating versions"
  homepage "https://knope-dev.github.io/knope/"
  url "https://github.com/knope-dev/knope/archive/refs/tags/knope/v0.18.3.tar.gz"
  sha256 "d68a1387ac8a09f01f960b1e775be9e22e54268adfb3a8e77b7a3f55c363ab72"
  license "MIT"
  head "https://github.com/knope-dev/knope.git", branch: "main"

  bottle do
    root_url "https://github.com/knope-dev/homebrew-tap/releases/download/knope-0.18.2"
    sha256 cellar: :any,                 arm64_sonoma: "a710eea704a733ececd900818c77efecf9842118cc0a72f984c79103a060a800"
    sha256 cellar: :any,                 ventura:      "19c22a6119cfc1341981f28f2b3787db8b17e2792a1d6666c621258c09649e16"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7f89def869a320d05e851e85854a79fc96a2feb655259eb451a5b249455c9373"
  end

  depends_on "rust" => :build
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/knope")
  end

  test do
    system "#{bin}/knope", "--help"
  end
end
