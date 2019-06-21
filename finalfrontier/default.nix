{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, gnumake,
  pandoc, darwin }:

let
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfrontier";
    rev = "0.6.1";
    sha256 = "1yswamvn58jqskg8vj72lwy22y0b30n83wxm5jb080147zvr0sf8";
  };
in ((callPackage ./finalfrontier.nix {}).finalfrontier_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    hogwild = attr: { inherit src; };

    finalfrontier = attr: { inherit src; };

    finalfrontier-utils = attr: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      nativeBuildInputs = [ gnumake pandoc ];

      postBuild = ''
        ( cd ../man ; make )
      '';

      preFixup = ''
        mkdir -p "$out/man/man1"
        cp ../man/*.1 "$out/man/man1/"
      '';

      postInstall = ''
        # Remove finalfrontier_utils library.
        rm -rf $out/lib
      '';

      meta = with stdenv.lib; {
        description = "Train word embeddings with subword representations";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };
  };
}
