{ pkgs, stdenv, fetchFromGitHub, buildPythonPackage, alpinocorpus,
  boost, libxml2, libxslt }:

buildPythonPackage rec {
  pname = "alpinocorpus";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "rug-compling";
    repo = "alpinocorpus-python";
    rev = version;
    sha256 = "1742q5alq0g68ps7d6f9n1aa25wqim2gm423mq0akb8dv8hd2r2l";
  };

  buildInputs = [ alpinocorpus boost libxml2.dev libxslt ];

  postPatch = ''
    substituteInPlace setup.py \
    --replace "/usr/include/libxml2" "${libxml2.dev}/include/libxml2"
  '';

  meta = with stdenv.lib; {
    description = "Python binding for the alpinocorpus library";
    license = licenses.lgpl21;
    platforms = platforms.all;
  };
}
