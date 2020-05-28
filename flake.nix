{
  description = "danieldk packages";

  inputs.nixpkgs.url = github:NixOS/nixpkgs-channels/nixos-20.03;

  outputs = { self, nixpkgs }:
    with import nixpkgs;
    let
      systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      packages = forAllSystems (system:
        with import nixpkgs { inherit system; };
        callPackage ./default.nix {}
      );
  };
}
