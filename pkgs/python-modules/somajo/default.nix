{ pkgs, stdenv, fetchFromGitHub, buildPythonPackage, isPy3k, regex }:

buildPythonPackage rec {
  pname = "somajo";
  version = "2.0.1";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "tsproisl";
    repo = "SoMaJo";
    rev = "v${version}";
    sha256 = "1841z74h9mv7k8xywncsk1vn90nlxsfx6ipv5aydf9fw9hyipgsv";
  };

  propagatedBuildInputs = [ regex ];

  meta = with stdenv.lib; {
    description = "Tokenizer and sentence splitter for German and English web texts";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
