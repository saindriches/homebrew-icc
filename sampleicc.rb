class Sampleicc < Formula
  desc "ICC profiles i/o and manipulating library and CMM"
  homepage "https://sourceforge.net/projects/sampleicc/"
  head "https://github.com/saindriches/SampleICC.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "libtiff"

  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--with-tifflib=#{Formula["libtiff"].opt_prefix}"
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end
end