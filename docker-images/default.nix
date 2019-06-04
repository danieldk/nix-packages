{ dockerTools, stickerModels }:

let
  stickerImage = import ./sticker-image.nix;
in {
  sticker = {
    de-pos = stickerImage {
      inherit dockerTools;
      model = stickerModels.de-pos;
    };

    de-topo = stickerImage {
      inherit dockerTools;
      model = stickerModels.de-topo;
    };

    de-deps = stickerImage {
      inherit dockerTools;
      model = stickerModels.de-deps;
    };
  };
}
