{ stdenv, mkDerivation, fetchFromGitHub, cmake, git, alpinocorpus, boost, libxml2, libxslt
, qtbase, xercesc, xqilla, zlib }:

mkDerivation rec {
  pname = "dact";
  version = "2.6.7";

  src = fetchFromGitHub {
    owner = "rug-compling";
    repo = pname;
    rev = version;
    sha256 = "0vgs526ilkfr01jq2jxgaa0cvvx0jyy4685kfpjfsyvpqqcinmgm";
  };

  nativeBuildInputs = [
    cmake git
  ];

  buildInputs = [
    alpinocorpus boost libxml2 libxslt qtbase xercesc xqilla zlib
  ];

  meta = with stdenv.lib; {
    description = "Alpino treebank search tool";
    license = licenses.lgpl21;
    maintainers = with maintainers; [ danieldk ];
    platforms = platforms.unix;
  };
}
