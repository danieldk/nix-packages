{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub, darwin }:

let
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfusion-utils";
    rev = "0.8.0";
    sha256 = "0pq90vhlq3hphj59jck79ngsdf1fynn7nqnbykiiixxrmayr4fwj";
  };
in ((callPackage ./finalfusion-utils.nix {}).finalfusion_utils {}).override {
  crateOverrides = defaultCrateOverrides // {
    finalfusion-utils = attr: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      postInstall = ''
        rm -rf $out/lib
      '';

      meta = with stdenv.lib; {
        description = "Utilities for finalfusion word embeddings";
        license = licenses.free;
        platforms = platforms.all;
      };
    };

    ndarray = attr: {
      features = [ "default" ];
    };
  };
}
