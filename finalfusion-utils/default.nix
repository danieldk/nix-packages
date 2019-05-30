{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, darwin }:

let
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfusion-rust";
    rev = "v0.5.1";
    sha256 = "06lkyj5bw8imc1hrafkbfs0rbz3y69y4ijs1fq50fxqjbi0g4axp";
  };
in ((callPackage ./finalfusion-utils.nix {}).finalfusion_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    # Can be removed in the next major release, since finalfusion-utils
    # is not a Cargo workspace anymore.
    finalfusion = attr: { inherit src; };

    finalfusion-utils = attr: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      meta = with stdenv.lib; {
        description = "Utilities for finalfusion word embeddings";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };

    ndarray = attr: {
      features = [ "default" ];
    };
  };
}
