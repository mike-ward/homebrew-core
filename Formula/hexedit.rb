class Hexedit < Formula
  desc "View and edit files in hexadecimal or ASCII"
  homepage "http://rigaux.org/hexedit.html"
  url "https://github.com/pixel/hexedit/archive/1.5.tar.gz"
  sha256 "27a2349f659e995d7731ad672450f61a2e950330049a6fb59b77490c5e0015ac"
  license "GPL-2.0"
  head "https://github.com/pixel/hexedit.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "4b53f01b5dace2c4549295b110b6f8320e87beee63b06fd7276ed179017eab52" => :catalina
    sha256 "50d22aea785dda60c33b9e4e54640c44e64a0c6cab64b560a05a921bb6d078f2" => :mojave
    sha256 "9a6c6e290d26d793c2e2b85a1cc1ef0147ea70d957859228d5a363c8ebb3fb4f" => :high_sierra
    sha256 "c93767f4bec81f4d372d4af42a7505131f61ce4992b2549210aa464ee5b309ce" => :sierra
    sha256 "8939412f612cb0b5a8fd49fc1045bdd9dee9f729cf741fba2421ed28deeadc82" => :el_capitan
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    shell_output("#{bin}/hexedit -h 2>&1", 1)
  end
end
