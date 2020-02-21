{ callPackage
, lib
, stdenv

, fetchgit
, defaultCrateOverrides

# Native build inputs
, installShellFiles ? null # Available in 19.09 and later.
}:

let
  cargo_nix = callPackage ./Cargo.nix { defaultCrateOverrides = crateOverrides; };
  src = fetchgit {
    url = "https://git.sr.ht/~danieldk/alpino-tokenizer";
    rev = "8260b09d925a77f63d8d7b14f68ed5124ba8d94b";
    sha256 = "1jyrpg050s7yzvyaip3kna7w45dk2w1yccnq99qlmnr0v4zyrllc";
  };
  crateOverrides = defaultCrateOverrides // {
    alpino-tokenize = attr: {
      inherit src;

      nativeBuildInputs = lib.optional (!isNull installShellFiles) installShellFiles;

      postBuild = ''
        for shell in bash fish zsh; do
          target/bin/alpino-tokenize completions $shell > completions.$shell
        done
      '';

      postUnpack = "sourceRoot=$sourceRoot/alpino-tokenize";

      postInstall = ''
        rm -rf $out/lib
        rm -f $out/bin/*.d
      '' + lib.optionalString (!isNull installShellFiles) ''
        # Install shell completions
        installShellCompletion completions.{bash,fish,zsh}
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
