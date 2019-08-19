class Pip3line < Formula
  desc "Swiss Army knife for raw bytes manipulation & interception"
  homepage "https://metrodango.github.io/pip3line/index.html"
  url "https://github.com/metrodango/pip3line/archive/v3.7.0.tar.gz"
  sha256 "c67ec99c3824b644df19477df773e1161d74d84c1a44b2fdad6d10c01fe0c405"
  depends_on "cmake" => :build
  depends_on "openssl"
  depends_on "python"
  depends_on "qscintilla2"
  depends_on "qt"

  def install
    ENV["DISTORM_MODE"]="ON"
    system "cmake", ".", *std_cmake_args, "-DALL=ON", "-DWITH_PYTHON27=OFF", "-DWITH_SCINTILLA=ON", "-DWITH_DISTORM_LINK_STATICALLY=ON"
    system "make", "install"
  end
  test do
    system "echo 'testing the beast' | pip3linecmd -t Base64 | pip3linecmd -t Base64 -o"
  end
end
