class Pip3line < Formula
  desc "Swiss Army knife for raw bytes manipulation & interception"
  homepage "https://metrodango.github.io/pip3line/index.html"
  url "https://github.com/metrodango/pip3line/archive/v3.6.0.tar.gz"
  sha256 "0d886d650eae37047bc24f5bf74bcbf89eaaeb2a45994464ac78a45796f84774"
  sha256 "d37751b500daf856331dff6e7faaa6b9dbe4f1ed7f56695b8b881dcd97df7dea"
  depends_on "cmake" => :build
  depends_on "openssl"
  depends_on "python"
  depends_on "qscintilla2"
  depends_on "qt"

  def install
    ENV["DISTORM_MODE"]="static"
    system "cmake", ".", *std_cmake_args, "-DALL=ON", "-DWITH_PYTHON27=OFF", "-DWITH_SCINTILLA=ON", "-DWITH_DISTORM_LINK_STATICALLY=ON"
    system "make", "install"
  end
  test do
    system "echo 'testing the beast' | pip3linecmd -t Base64 | pip3linecmd -t Base64 -o"
  end
end
