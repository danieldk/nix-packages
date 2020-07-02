{ callPackage
, lib
, stdenv

, fetchFromGitHub
, defaultCrateOverrides

  # Native build inputs
, installShellFiles
}:
let
  cargo_nix = callPackage ./Cargo.nix { defaultCrateOverrides = crateOverrides; };
  version = "0.2.2";
  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "alpino-tokenizer";
    rev = version;
    sha256 = "00m8j6sbdp44p0byazx1vijgpssfz4353np4xnhh5m9qkhbm28jx";
  };
  crateOverrides = defaultCrateOverrides // {
    alpino-tokenize = attr: rec {
      inherit src;

      pname = "alpino-tokenize";

      name = "${pname}-${version}";

      nativeBuildInputs = [ installShellFiles ];

      postBuild = ''
        for shell in bash fish zsh; do
          target/bin/alpino-tokenize completions $shell > alpino-tokenize.$shell
        done
      '';

      postUnpack = "sourceRoot=$sourceRoot/alpino-tokenize";

      postInstall = ''
        # Install shell completions
        installShellCompletion alpino-tokenize.{bash,fish,zsh}
      '';

      meta = with stdenv.lib; {
        description = "Command-line Rust wrapper around the Alpino tokenizer";
        license = licenses.lgpl21Plus;
        maintainers = with maintainers; [ danieldk ];
        platforms = platforms.unix;
      };
    };

    alpino-tokenizer = attr: {
      inherit src;
      postUnpack = "sourceRoot=$sourceRoot/alpino-tokenizer";
    };

    alpino-tokenizer-sys = attr: {
      inherit src;
      postUnpack = "sourceRoot=$sourceRoot/alpino-tokenizer-sys";
    };
  };
in cargo_nix.workspaceMembers.alpino-tokenize.build
