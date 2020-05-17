class Pip3line < Formula
  desc "Swiss Army knife for raw bytes manipulation & interception"
  homepage "https://metrodango.github.io/pip3line/index.html"
  url "https://github.com/metrodango/pip3line/archive/v3.7.1.tar.gz"
  sha256 "a0b33df845b5ae1c0df5077a112c512717e4e7636d544d2c5cf3c9cce7cf2172"
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
