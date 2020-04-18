{ pkgs
, stdenv
, callPackage
, fetchFromGitHub
, defaultCrateOverrides

# Native build inputs
, installShellFiles
}:

let
  cargo_nix = callPackage ./Cargo.nix {
    inherit pkgs;
    defaultCrateOverrides = crateOverrides;
  };
  crateOverrides = defaultCrateOverrides // {
    conllu-utils = attr: rec {
      pname = "conllu-utils";
      name = "${pname}-${attr.version}";

      src = fetchFromGitHub {
        owner = "danieldk";
        repo = "conllu-utils";
        rev = "0.1.6";
        sha256 = "0srnn9gv6vz95iwj4zdkjm225jdk6jzldc8kv07ycmf09zx8z81q";
      };

      nativeBuildInputs = [ installShellFiles ];

      postBuild = ''
        for shell in bash fish zsh; do
          target/bin/conllu completions $shell > conllu.$shell
        done
      '';

      postInstall = ''
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
