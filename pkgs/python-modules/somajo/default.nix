{ pkgs, stdenv, fetchFromGitHub, buildPythonPackage, isPy3k, regex }:

buildPythonPackage rec {
  pname = "SoMaJo";
  version = "2.0.3";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "tsproisl";
    repo = pname;
    rev = "v${version}";
    sha256 = "1js06jsjyddsd22546fvhcgiz848kvynfwh2fxjgnazzw9344hji";
  };

  propagatedBuildInputs = [ regex ];

  meta = with stdenv.lib; {
    description = "Tokenizer and sentence splitter for German and English web texts";
    homepage = "https://github.com/tsproisl/SoMaJo";
    license = licenses.gpl3;
    maintainers = with maintainers; [ danieldk ];
  };
}
