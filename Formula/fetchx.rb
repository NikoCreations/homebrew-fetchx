class Fetchx < Formula
  desc "Fast terminal downloader with URL monitoring"
  homepage "https://github.com/NikoCreations/fetchx"
  url "https://github.com/NikoCreations/fetchx/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "49225bc5333d96c5d69064bbc46ed7773728d3295b88bf5f107ac8ab90ae4aab"
  license "MIT"

  depends_on "cmake" => :build

  def install
    rm_rf "build"
    system "cmake", "-S", ".", "-B", "build", "-DCMAKE_BUILD_TYPE=Release"
    system "cmake", "--build", "build", "--parallel"
    bin.install "build/fetchx"
    bin.install "build/watchurl"
  end

  test do
    assert_match "fetchx 0.1.1", shell_output("#{bin}/fetchx --version")
    assert_match "watchurl 0.1.1", shell_output("#{bin}/watchurl --version")
  end
end
