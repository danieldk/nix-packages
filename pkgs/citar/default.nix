{ stdenv, fetchFromGitHub, buildGoPackage }:

buildGoPackage rec {
  pname = "citar";
  version = "1.0.0";

  goPackagePath = "github.com/danieldk/citar";
  subPackages = [ "cmd/citar-evaluate" "cmd/citar-tag" "cmd/citar-train" ];

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "citar";
    rev = "${version}";
    sha256 = "19n0k3kidiw42zwgcw3wdnyy7ri091782ssh83lw89f2gcnjxm08";
  };

  goDeps = ./deps.nix;

  meta = with stdenv.lib; {
    description = "Trigram HMM part-of-speech tagger";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
