{ stdenv, fetchFromGitHub, cmake, pkgconfig, boost, dbxml, libiconv, libxml2,
  libxslt, xercesc, xqilla }:

stdenv.mkDerivation rec {
  pname = "alpinocorpus";
  version = "2.8.4";

  src = fetchFromGitHub {
    owner = "rug-compling";
    repo = "alpinocorpus";
    rev = version;
    sha256 = "0h7lnx9zj1xl92dc8ml8q6a23ls1hqc0acrqwm5k2113njzzlcdv";
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
