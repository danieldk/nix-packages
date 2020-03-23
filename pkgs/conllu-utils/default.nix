{ stdenv
, callPackage
, fetchFromGitHub
, defaultCrateOverrides

# Native build inputs
, installShellFiles
}:

let
  cargo_nix = callPackage ./Cargo.nix {
    defaultCrateOverrides = crateOverrides;
  };
  crateOverrides = defaultCrateOverrides // {
    conllu-utils = attr: rec {
      pname = "conllu-utils";
      name = "${pname}-${attr.version}";

      src = fetchFromGitHub {
        owner = "danieldk";
        repo = "conllu-utils";
        rev = "0.1.3";
        sha256 = "0nbhq0j1nnpn48gc4jr92pd88algralyrvsg18vr8wcrc1nbv7w3";
      };

      nativeBuildInputs = [ installShellFiles ];

      postBuild = ''
        for shell in bash fish zsh; do
          target/bin/conllu completions $shell > conllu.$shell
        done
      '';

      postInstall = ''
        rm $out/bin/*.d

        # Install shell completions
        installShellCompletion conllu.{bash,fish,zsh}
      '';

      meta = with stdenv.lib; {
        description = "Utilities for working with CoNLL-U files";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };
  };
in cargo_nix.rootCrate.build