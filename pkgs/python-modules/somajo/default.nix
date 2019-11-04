{ pkgs, stdenv, fetchFromGitHub, buildPythonPackage, isPy3k, regex }:

buildPythonPackage rec {
  pname = "somajo";
  version = "1.10.7";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "tsproisl";
    repo = "SoMaJo";
    rev = "v${version}";
    sha256 = "1jkrk25vhc6j66jkbczqr3ncz1a5qx89xrrpmp2zgfjnh6fl190f";
  };

  propagatedBuildInputs = [ regex ];

  meta = with stdenv.lib; {
    description = "Tokenizer and sentence splitter for German and English web texts";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
