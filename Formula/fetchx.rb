class Fetchx < Formula
  desc "Fast terminal downloader with URL monitoring"
  homepage "https://github.com/NikoCreations/fetchx"
  url "https://github.com/NikoCreations/fetchx/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "83ac598e747b4394f0dd098f301c1856312693a696971c4dc8cd7a3302dbe86c"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", "-DCMAKE_BUILD_TYPE=Release"
    system "cmake", "--build", "build", "--parallel"
    bin.install "build/fetchx"
    bin.install "build/watchurl"
  end

  test do
    assert_match "fetchx 0.1.0", shell_output("#{bin}/fetchx --version")
    assert_match "watchurl 0.1.0", shell_output("#{bin}/watchurl --version")
  end
end
