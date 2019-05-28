{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, gnumake, pandoc }:

let
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfrontier";
    rev = "0.5.0";
    sha256 = "0z1wq1klpyi7xqarkbn7dj3indxii04a6nfdhih551xsnck79x3f";
  };
in ((callPackage ./finalfrontier.nix {}).finalfrontier_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    hogwild = attr: { inherit src; };

    finalfrontier = attr: { inherit src; };

    finalfrontier-utils = attr: {
      inherit src;

      nativeBuildInputs = [ gnumake pandoc ];

      postBuild = ''
        ( cd ../man ; make )
      '';

      preFixup = ''
        mkdir -p "$out/man/man1"
        cp ../man/*.1 "$out/man/man1/"
      '';

      meta = with stdenv.lib; {
        description = "Train word embeddings with subword representations";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };
  };
}
