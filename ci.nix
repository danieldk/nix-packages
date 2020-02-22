{ pkgs ? import (import ./nix/sources.nix).nixpkgs {} }:

with builtins;

let
  isReserved = n: n == "lib" || n == "overlays" || n == "modules";
  isDerivation = p: isAttrs p && p ? type && p.type == "derivation";
  # Matching could probably be improved?
  isInHydraPlatforms = p: !(p.meta ? "hydraPlatforms")
    || builtins.elem builtins.currentSystem p.meta.hydraPlatforms;
  isBuildable = p: !(p.meta.broken or false) && p.meta.license.free or true && isInHydraPlatforms p;
  isCacheable = p: !(p.preferLocalBuild or false);
  shouldRecurseForDerivations = p: isAttrs p && p.recurseForDerivations or false;

  nameValuePair = n: v: { name = n; value = v; };

  concatMap = builtins.concatMap or (f: xs: concatLists (map f xs));

  flattenPkgs = s:
    let
      f = p:
        let res = builtins.tryEval (
          if shouldRecurseForDerivations p then flattenPkgs p
          else if isDerivation p then [p]
          else []
        );
        in if res.success then res.value else [];
    in
      concatMap f (attrValues s);

  outputsOf = p: map (o: p.${o}) p.outputs;

  nurAttrs = import ./default.nix { inherit pkgs; };

  nurPkgs =
    flattenPkgs
    (listToAttrs
    (map (n: nameValuePair n nurAttrs.${n})
    (filter (n: !isReserved n)
    (attrNames nurAttrs))));

in

rec {
  buildPkgs = filter isBuildable nurPkgs;
  cachePkgs = filter isCacheable buildPkgs;

  buildOutputs = concatMap outputsOf buildPkgs;
  cacheOutputs = concatMap outputsOf cachePkgs;
}
