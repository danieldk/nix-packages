{ stdenv, fetchFromGitHub, cmake, pkgconfig, boost, dbxml, libiconv, libxml2,
  libxslt, xercesc, xqilla }:

stdenv.mkDerivation rec {
  pname = "alpinocorpus";
  version = "2.8.3";

  src = fetchFromGitHub {
    owner = "rug-compling";
    repo = "alpinocorpus";
    rev = "${version}";
    sha256 = "0xrviphcawxgwfljkvvh162xqca215j53w9xyjgralr2pzslr5cc";
  };

  nativeBuildInputs = [
    cmake pkgconfig
  ];

  buildInputs = [
    boost dbxml libxml2 libxslt xercesc xqilla
  ] ++ stdenv.lib.optional stdenv.isDarwin libiconv;

  meta = with stdenv.lib; {
    description = "Library for Alpino treebanks";
    license = licenses.lgpl21;
    platforms = platforms.unix;
  };

}
