class Iccxml < Formula
  desc "ICC profiles i/o and manipulating library and CMM"
  homepage "https://sourceforge.net/projects/iccxml/"
  url "https://downloads.sourceforge.net/project/iccxml/IccXML-Src/IccXML-0.9.8/IccXML-0.9.8.tar.gz"
  sha256 "939913d350c93f19e063e397ba2a5544975ea447c921222070dc3d9da14f20af"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "sampleicc"

  uses_from_macos "libxml2"

  patch :DATA

  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}"
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end
end
__END__
diff --git a/iccxml.pc.in b/iccxml.pc.in
index b2ff686..73a5da1 100644
--- a/iccxml.pc.in
+++ b/iccxml.pc.in
@@ -5,7 +5,7 @@ includedir=@includedir@/IccXML
 datarootdir=@datarootdir@
 datadir=@datadir@

-Name: sampleicc
+Name: iccxml
 Description: ICC profiles to XML and back convertions and schema
 Version: @ICCXML_MAJOR_VERSION@.@ICCXML_MINOR_VERSION@.@ICCXML_MICRO_VERSION@
 Libs: -L${libdir} -lIccXML -lm
