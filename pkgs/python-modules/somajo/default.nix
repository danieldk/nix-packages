{ pkgs, stdenv, fetchFromGitHub, buildPythonPackage, isPy3k, regex }:

buildPythonPackage rec {
  pname = "somajo";
  version = "1.10.0";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "tsproisl";
    repo = "SoMaJo";
    rev = "v${version}";
    sha256 = "03drasqf32jih90l3g7fryy44wpqlhy9s8pzahmj613fj626r1jm";
  };

  propagatedBuildInputs = [ regex ];

  meta = with stdenv.lib; {
    description = "Tokenizer and sentence splitter for German and English web texts";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
