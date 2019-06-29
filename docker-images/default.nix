{ dockerTools, stickerModels }:

let
  stickerImage = import ./sticker-image.nix;
in {
  sticker = {
    de-pos = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-pos";
      model = stickerModels.de-pos;
    };

    de-topo = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-topo";
      model = stickerModels.de-topo;
    };

    de-deps = stickerImage {
      inherit dockerTools;
      tagPrefix = "de-deps";
      model = stickerModels.de-deps;
    };

    nl-deps-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "nl-deps-ud";
      model = stickerModels.nl-deps-ud;
    };

    nl-pos-ud = stickerImage {
      inherit dockerTools;
      tagPrefix = "nl-pos-ud";
      model = stickerModels.nl-pos-ud;
    };
  };
}
