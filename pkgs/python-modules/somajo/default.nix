{ pkgs, stdenv, fetchFromGitHub, buildPythonPackage, isPy3k, regex }:

buildPythonPackage rec {
  pname = "somajo";
  version = "1.11.0";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "tsproisl";
    repo = "SoMaJo";
    rev = "v${version}";
    sha256 = "0wj5fyzszfiwhi2l4ygkb18mxwj1l9j2yn5l5jnas50f0yd33rsd";
  };

  propagatedBuildInputs = [ regex ];

  meta = with stdenv.lib; {
    description = "Tokenizer and sentence splitter for German and English web texts";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
